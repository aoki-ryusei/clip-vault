# == Schema Information
#
# Table name: videos
#
#  id                 :bigint           not null, primary key
#  description        :string(255)
#  duration           :integer
#  thumbnail_url      :string(255)
#  title              :string(255)
#  url                :string(255)
#  video_created_at   :datetime
#  video_published_at :datetime
#  view_count         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  streamers_id       :bigint           not null
#
# Indexes
#
#  index_videos_on_streamers_id  (streamers_id)
#
# Foreign Keys
#
#  fk_rails_...  (streamers_id => streamers.id)
#
class Video < ApplicationRecord
  belongs_to :streamer
end
