# == Schema Information
#
# Table name: token_storages
#
#  id         :bigint           not null, primary key
#  expired_at :datetime
#  name       :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TokenStorage < ApplicationRecord
  validates :token, presence: true
  validates :expired_at, presence: true
end
