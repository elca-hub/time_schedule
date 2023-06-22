FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test user#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
