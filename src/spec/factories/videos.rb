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
#  streamer_id        :bigint           not null
#
# Indexes
#
#  index_videos_on_streamer_id  (streamer_id)
#
# Foreign Keys
#
#  fk_rails_...  (streamer_id => streamers.id)
#
FactoryBot.define do
  factory :video do
    streamer { nil }
    title { "MyString" }
    description { "MyString" }
    video_created_at { "2025-01-30 00:04:55" }
    video_published_at { "2025-01-30 00:04:55" }
    url { "MyString" }
    thumbnail_url { "MyString" }
    view_count { 1 }
    duration { 1 }
  end
end
