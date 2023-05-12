class User < ApplicationRecord
    has_secure_password
    has_many :user_tasks
    has_many :tasks, through: :user_tasks
    validates :name, length: {maximum:100}, uniqueness: true, presence: true
    validates :password, length: {minimum: 8, maximum: 32}, presence: true
end
