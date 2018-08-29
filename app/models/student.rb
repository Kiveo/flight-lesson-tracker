class Student < ActiveRecord::Base
  has_many :lessons
  has_many :instructors, through: :lessons

  validates :name, presence: true
  validates :student_id, uniqueness: true

  def slogan
    slogan = "Aviator #{self.name}, has joined our team as cadet: #{self.student_id}."
  end

end
