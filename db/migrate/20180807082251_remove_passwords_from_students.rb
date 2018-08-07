class RemovePasswordsFromStudents < ActiveRecord::Migration
  
  def change
    remove_column :students, :password_digest, :string
  end

end
