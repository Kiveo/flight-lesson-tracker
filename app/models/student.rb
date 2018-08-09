class Student < ActiveRecord::Base
  has_many :lessons
  has_many :instructors, through: :lessons

end
class Student < ActiveRecord::Base 
  has_many :lessons 
  has_many :instructors, through: :lessons

  validates :name, presence: true
  validates :student_id, numericality: {greater_than: 0}
  validates :student_id, numericality: {only_integer: true}
  validates :student_id, uniqueness: true
  
end