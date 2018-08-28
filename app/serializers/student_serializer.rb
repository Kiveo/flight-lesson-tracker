class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :student_id
  has_many :lessons
  has_many :instructors, through: :lessons
end
