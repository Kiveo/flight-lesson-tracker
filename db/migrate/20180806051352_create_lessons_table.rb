class CreateLessonsTable < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :description
      t.datetime :lesson_datetime
      t.integer :student_id
      t.integer :instructor_id
    end
  end
end
