FactoryBot.define do
  factory :task do
    association :user
    title { 'title' }
    content { 'default content' }
  end
end
