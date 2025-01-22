FactoryBot.define do
  factory :token_storage do
    id { 1 }
    token { "MyString" }
    expired_at { "2025-01-22 11:43:15" }
    created_at { "2025-01-22 11:43:15" }
    updated_at { "2025-01-22 11:43:15" }
  end
end
