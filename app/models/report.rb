class Report < ActiveRecord::Base
  belongs_to :instructor

  validates :title, presence: true
  validates :flight_hours, presence: true 
  validates :flight_hours, numericality: true
  
end