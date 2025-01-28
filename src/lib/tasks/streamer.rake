namespace :streamer do
  task :get => :environment do
    include TwitchHelper
    get_streamers(["fantasista_jp", "fps_shaka"])
  end
end
