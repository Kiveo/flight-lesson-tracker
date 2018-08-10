class Instructor < ActiveRecord::Base
  has_many :lessons
  has_many :students, through: :lessons
  has_many :reports, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :cfi, presence: true
  validates :cfi, numericality: {greater_than: 1}
  validates :cfi, numericality: {only_integer: true}
  validates :cfi, uniqueness: true 
  validates :password, presence: true
  validates :password, length: { minimum: 2}

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(cfi: auth_hash[:uid]).first_or_create do |instructor|
      instructor.password = SecureRandom.hex
      instructor.name = auth_hash[:info][:name] 
    end 
  end 

  def students_scheduled
    self.lessons.size
  end
  
end 
