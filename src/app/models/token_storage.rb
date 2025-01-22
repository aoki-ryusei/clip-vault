class TokenStorage < ApplicationRecord
  validates :token, presence: true
  validates :expired_at, presence: true
end
