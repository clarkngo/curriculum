class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses         
  has_many :comments
  has_many :messages
  has_many :chatrooms, through: :messages
  validates :username, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
