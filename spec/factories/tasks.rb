FactoryBot.define do
  factory :task do
    association :user
    association :tag
    title { 'title' }
    content { 'default content' }
  end
end
