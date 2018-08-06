class CreateInstructorsTable < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.integer :cfi

      t.string :password_digest
    end
  end
end
