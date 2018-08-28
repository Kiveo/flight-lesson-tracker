class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name, :cfi
  has_many :lessons
  has_many :student, through: :lessons
end
