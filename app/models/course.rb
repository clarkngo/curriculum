class Course < ApplicationRecord
  validates :category_id, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user, optional: true
  belongs_to :category
end
