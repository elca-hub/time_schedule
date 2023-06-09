FactoryBot.define do
  factory :tag do
    association :user
    name { 'math' }
    color_code {'#000000'}
    description { '数学の勉強' }
  end
end
