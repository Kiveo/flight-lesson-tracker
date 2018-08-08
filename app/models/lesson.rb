class Lesson < ActiveRecord::Base
  belongs_to :student
  belongs_to :instructor

  validates :instructor_id, presence: true
  validates :instructor_id, numericality: {greater_than: 1}
  validates :student_id, presence: true 
  validates :student_id, numericality: {greater_than: 1}
  validates :description, presence: true 
  validates :lesson_datetime, presence: true 

end
