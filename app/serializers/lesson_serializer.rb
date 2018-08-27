class LessonSerializer < ActiveModel::Serializer
  attributes :id, :description, :lesson_datetime, :student_id, :instructor_id
  belongs_to :instructor 
end
