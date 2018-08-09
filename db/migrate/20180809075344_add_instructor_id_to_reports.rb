class AddInstructorIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :instructor_id, :integer
  end
end
