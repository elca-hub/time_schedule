class Task < ApplicationRecord
    has_many :user_tasks, dependent: :destroy
    has_many :users, through: :user_tasks
    validates :title, length: {maximum:100}, presence: true
    validates :content, length: {maximum:255}, presence: true
end
