class Task < ApplicationRecord
    belongs_to :user
    belongs_to :tag

    validates :title, length: {maximum:100}, presence: true
    validates :content, length: {maximum:500}
end
