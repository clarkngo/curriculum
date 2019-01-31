class RemoveCodeInCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :code
  end
end
