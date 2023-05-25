class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: {maximum:100}, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
end
