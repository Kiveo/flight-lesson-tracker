class LessonSerializer < ActiveModel::Serializer
  attributes :id, :description, :lesson_datetime, :student_id, :instructor_id, :next, :previous
  belongs_to :instructor
  belongs_to :student
end
