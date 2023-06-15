class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, IconUploader

  has_many :tags, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :name, length: {maximum:100}, presence: true
  validates :email, presence: true, uniqueness: true
end
