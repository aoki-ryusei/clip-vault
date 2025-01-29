# TwitchのAPI連携を行うためのHelper
module TwitchHelper

  # ストリーマー情報を取得する
  #
  # @return [Hash] ストリーマー情報
  def get_streamers(streamer_codes)
    token = get_token
    streamers = TwitchApi::Streamer.new
    response = streamers.get(streamer_codes, token)
    response
  end

  private
  # titchの認証情報を返す
  #
  # @return String 認証情報
  def get_token
    token_storage = TokenStorage.find_or_initialize_by(name: "twitch")
    if token_storage.token.nil? or token_storage.expired_at < Time.now
      store_token token_storage
    end
    token_storage.token
  end

  # 認証情報を保存する
  #
  # @param [TokenStorage] token_storage 認証情報
  # @return void
  def store_token(token_storage)
    auth = TwitchApi::Auth.new
    token = auth.get
    token_storage.token = token[:access_token]
    # Time.nowはサーバーのタイムゾーンに依存している
    token_storage.expired_at = Time.now + token[:expires_in].to_i
    token_storage.save!
  end

end
