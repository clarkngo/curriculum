class AddCategoryIdtoCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :category_id, :integer
    add_index :courses, :category_id    
  end
end
