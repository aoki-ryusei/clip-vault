require "net/http"
require "uri"

module TwitchApi
  # 認証情報
  class Auth
    include Logging
    # 認証情報を取得する
    #
    # @return [Hash] 認証情報
    def get
      url = URI.parse(ENV.fetch("TWITCH_GET_TOKEN_URL"))
      params = {
        client_id: ENV.fetch("TWITCH_CLIENT_ID"),
        client_secret: ENV.fetch("TWITCH_CLIENT_SECRET"),
        grant_type: ENV.fetch("TWITCH_GRANT_TYPE")
      }
      request_body = URI.encode_www_form(params)

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == "https")
      request = Net::HTTP::Post.new(url.path)
      request["Content-Type"] = "application/x-www-form-urlencoded"
      request.body = request_body
      response = http.request(request)
      log_debug("[request] url: #{url}, method: #{request.method}, path: #{request.path}, body: #{request.body}")
      if !response.is_a?(Net::HTTPSuccess)
        response_json = JSON.parse(response.body)
        log_error("[response] url: #{url}, code: #{response.code}, body: #{response_json}")
        return JSON.parse(response_json)
      end
      response_json = JSON.parse(response.body)
      log_debug("[response] url: #{url}, code: #{response.code}, body: #{response_json}")

      {
        access_token: response_json["access_token"],
        expires_in: response_json["expires_in"]
      }
    end
  end

  # ストリーマー情報
  class Streamer
    include Logging
    # ストリーマー情報を取得する
    #
    # @param [String] streamer_codes ストリーマーコード
    # @return [Hash] ストリーマー情報
    def get(streamer_codes, token)
      url = URI.parse(ENV.fetch("TWITCH_GET_USER_URL"))
      url.query = URI.encode_www_form(streamer_codes.map { |login| [ "login", login ] })

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == "https")
      request = Net::HTTP::Get.new(url)
      # Bearer認証のトークンを付与
      request["Authorization"] = "Bearer #{token}"
      request["Client-Id"] = ENV.fetch("TWITCH_CLIENT_ID")
      response = http.request(request)
      log_debug("[request] url: #{url}, method: #{request.method}, path: #{request.path}, body: #{request.body}")
      if !response.is_a?(Net::HTTPSuccess)
        response_json = JSON.parse(response.body)
        log_error("[response] url: #{url}, code: #{response.code}, body: #{response_json}")
        return JSON.parse(response_json)
      end
      response_json = JSON.parse(response.body)
      log_debug("[response] url: #{url}, code: #{response.code}, body: #{response_json}")

      {
        streamers: response_json["data"]
      }
    end
  end
end
