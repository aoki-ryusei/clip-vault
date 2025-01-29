namespace :streamer do
  task :get, [ :streamer_code ] => :environment do |_task, args|
    include TwitchHelper
    include Logging

    log_debug("[START TASKS] streamer get, count: #{args.to_a.count}", "tasks")
    streamer_codes = args.to_a
    response = get_streamers(streamer_codes)
    response[:streamers].each do |res_streamer|
      streamer = Streamer.find_or_initialize_by(id: res_streamer["id"])
      streamer.code = res_streamer["login"]
      streamer.name = res_streamer["display_name"]
      streamer.description = res_streamer["description"]
      streamer.email = res_streamer["email"]
      streamer.profile_image_url = res_streamer["profile_image_url"]
      streamer.account_created_at = res_streamer["created_at"]
      if !streamer.save!
        log_error("save error, streamer_code: #{res_streamer["login"]}, streamer_name: #{res_streamer["display_name"]}", "tasks")
        next
      end
      log_debug("save success, streamer_code: #{res_streamer["login"]}, streamer_name: #{res_streamer["display_name"]}", "tasks")
    end
    log_debug("[END TASKS] streamer get", "tasks")
  end
end
