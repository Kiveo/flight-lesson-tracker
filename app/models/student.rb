class Student < ActiveRecord::Base
  has_many :lessons
  has_many :instructors, through: :lessons

  has_secure_password #bcrypt

end
