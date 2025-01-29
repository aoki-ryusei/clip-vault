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
FactoryBot.define do
  factory :streamer do
    id { 2143312321 }
    code { "streamer_code" }
    name { "streamer_name" }
    description { "MyString" }
    email { "MyString" }
    profile_image_url { "MyString" }
    account_created_at { "2025-01-22 11:43:15" }
  end
end
