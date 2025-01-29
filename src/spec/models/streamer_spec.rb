# == Schema Information
#
# Table name: streamers
#
#  id                 :bigint           not null, primary key
#  account_created_at :datetime
#  code               :string(255)
#  description        :string(255)
#  email              :string(255)
#  name               :string(255)
#  profile_image_url  :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_streamers_on_code_and_name  (code,name) UNIQUE
#
require 'rails_helper'

RSpec.describe Streamer, type: :model do
  streamer = FactoryBot.build(:streamer)

  it '有効であること' do
    expect(streamer).to be_valid
  end

  it 'codeは必須であること' do
    streamer.code = nil
    expect(streamer).to_not be_valid
  end

  it 'nameは必須であること' do
    streamer.name = nil
    expect(streamer).to_not be_valid
  end
end
