class Instructor < ActiveRecord::Base
  has_many :lessons
  has_many :students, through: :lessons

  has_secure_password


  def students_scheduled
    self.lessons.size
  end
  
end 
