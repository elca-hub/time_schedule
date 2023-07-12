class Tag < ApplicationRecord
    belongs_to :user

    has_many :tasks, dependent: :destroy

    # descriptionが指定されていない場合は空文字を設定する
    before_validation do
        self.description = "" if self.description.nil?
    end

    validates :name, presence: true, length: {maximum:100}, uniqueness: true
    validates :color_code, presence: true, length: {maximum:7}
    validates :description, length: {maximum:500}
end
