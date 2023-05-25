class Task < ApplicationRecord
    belongs_to :user

    validates :title, length: {maximum:100}, presence: true
    validates :content, length: {maximum:255}, presence: true
end
