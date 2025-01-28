namespace :streamer do
  task :get, [:streamer_code] => :environment do |_task, args|
    include TwitchHelper
    include Logging

    log_debug("[streamer get tasks] start, args count: #{args.to_a.count}", "tasks")
    streamer_codes = args.to_a
    response = get_streamers(streamer_codes)
    log_debug("[streamer get tasks] end", "tasks")
  end
end
