class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :flight_hours
      t.integer :ground_hours
      
      t.timestamps null: false
    end
  end
end
