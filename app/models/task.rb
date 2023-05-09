class Task < ApplicationRecord
    has_many :user_tasks
    has_many :users, through: :user_tasks
    validates :title, uniqueness: true, presence: true
    validates :content, uniqueness: true, presence: true
end
