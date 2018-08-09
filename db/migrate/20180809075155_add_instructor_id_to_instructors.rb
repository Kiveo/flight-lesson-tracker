class AddInstructorIdToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :instructor_id, :integer
  end
end
