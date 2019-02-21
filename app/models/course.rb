class Course < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_header, PhotoUploader

  validates :category_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
end
