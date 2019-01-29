class AddCategoryInCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :category, :string
  end
end
