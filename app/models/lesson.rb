class Lesson < ActiveRecord::Base
  belongs_to :student
  belongs_to :instructor

  validates :instructor_id, presence: true
  validates :instructor_id, numericality: {greater_than: 0}
  validates :student_id, presence: true 
  validates :student_id, numericality: {greater_than: 0}
  validates :description, presence: true 
  validates :lesson_datetime, presence: true 
  #though a student and instructor may be paired multiple times, no lesson should occur at the same time as another lesson. 
  validates :lesson_datetime, uniqueness: true 

  scope :recent, -> { order("lessons.lesson_datetime DESC") }

end
