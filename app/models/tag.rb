class Tag < ApplicationRecord
    belongs_to :user

    has_many :tasks, dependent: :destroy

    validates :name, presence: true, length: {maximum:100}, uniqueness: true
end
