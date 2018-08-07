class Instructor < ActiveRecord::Base
  has_many :lessons
  has_many :students, through: :lessons

  has_secure_password

  validates :name, presence: true
  validates :cfi, presence: true
  validates :cfi,   numericality: {only_integer: true}
  validates :cfi, length: {minimum: 1}
  validates :cfi, uniqueness: true 
  validates :password, presence: true
  validates :password, length {minimum: 1}



  def students_scheduled
    self.lessons.size
  end
  
end 
