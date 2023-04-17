class User < ApplicationRecord
    validates :name, presence: true
    validates :pw, presence: true
end
