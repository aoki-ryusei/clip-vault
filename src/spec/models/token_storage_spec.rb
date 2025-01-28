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
require 'rails_helper'

RSpec.describe TokenStorage, type: :model do
  token_storage = FactoryBot.build(:token_storage)

  it '有効であること' do
    expect(token_storage).to be_valid
  end

  it 'tokenは必須であること' do
    token_storage.token = nil
    expect(token_storage).to_not be_valid
  end

  it 'expired_atは必須であること' do
    token_storage.expired_at = nil
    expect(token_storage).to_not be_valid
  end
end
