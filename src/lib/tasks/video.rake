require "chronic_duration"

namespace :video do
  task :get_all, [ :streamer_code ] => :environment do |_task, args|
    include TwitchHelper
    include Logging

    log_debug("[START TASKS] videos get, count: #{args.to_a.count}", "tasks")
    streamer = Streamer.find_by(code: args.streamer_code)
    if streamer.nil?
      log_error("streamer not found, streamer_code: #{args.streamer_code}", "tasks")
      next
    end
    res_videos = get_videos(streamer.id, "all")
    res_videos.each do |res_video|
      video = streamer.videos.find_or_initialize_by(id: res_video["id"])
      video.title = res_video["title"]
      video.description = res_video["description"]
      video.url = res_video["url"]
      video.thumbnail_url = res_video["thumbnail_url"]
      video.view_count = res_video["view_count"]
      video.duration = ChronicDuration.parse(res_video["duration"]).to_i
      video.video_created_at = res_video["created_at"]
      video.video_published_at = res_video["published_at"]
      if !video.save!
        log_debug("save error, streamer_code: #{streamer.code}, res_video_id: #{res_video["id"]}", "tasks")
        next
      end
      log_debug("save success, streamer_code: #{streamer.code}, res_video_id: #{res_video["id"]}", "tasks")
    end
    log_debug("[END TASKS] videos get, video_count: #{res_videos.count}", "tasks")
  end
end
