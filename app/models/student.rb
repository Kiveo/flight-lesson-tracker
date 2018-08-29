class Student < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :instructors, through: :lessons

  validates :name, presence: true
  validates :student_id, uniqueness: true

end
