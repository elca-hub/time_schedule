FactoryBot.define do
  factory :tag do
    association :user
    name { 'math' }
  end
end
