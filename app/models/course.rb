class Course < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user, optional: true

  def self.categories
    [
      'Preparatory',
      'Core',
      'Depth'
    ]
  end
end
