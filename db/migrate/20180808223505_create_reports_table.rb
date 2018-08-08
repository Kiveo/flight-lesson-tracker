class CreateReportsTable < ActiveRecord::Migration
  def change
    create_table :reports_tables do |t|
      t.string :title
      t.integer :flight_hours
      t.integer :ground_hours
    end
  end
end
