class Category < ApplicationRecord
  has_many :courses

  def self.categories
    [
      'Preparatory',
      'Core',
      'Depth'
    ]
  end
end
