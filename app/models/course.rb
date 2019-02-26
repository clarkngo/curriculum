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

  # build sql query
  def self.search(term)

    if term
      
      q = "%#{term}%"
      
      includes(:category).where(query_string, 
            q, q, q).references(:category)
    else
      all
    end
  end

  def self.query_string
    fields = ""
    fields += 'categories.name ILIKE ?'
    fields += ' OR '
    fields += 'courses.name ILIKE ?'
    fields += ' OR '
    fields += 'description ILIKE ?'
    fields
  end  
end
