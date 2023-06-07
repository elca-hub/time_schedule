class Tag < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: {maximum:100}, uniqueness: true
end
