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
require 'rails_helper'

RSpec.describe Video, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
