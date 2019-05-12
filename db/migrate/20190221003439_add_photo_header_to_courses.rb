class AddPhotoHeaderToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :photo_header, :string
  end
end
