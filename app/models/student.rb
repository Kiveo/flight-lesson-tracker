class Student < ActiveRecord::Base
  has_many :lessons
  has_many :instructors, through: :lessons

end
class Student < ActiveRecord::Base 
  has_many :lessons 
  has_many :instructors, through: :lessons

  validates :name, presence: true
  
end