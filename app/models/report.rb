class Report < ActiveRecord::Base
  belongs_to :instructor

  validates :title, presence: true
  validates :flight_hours, presence: true 
  validates :flight_hours, numericality: true
  #not all instructors will have ground hours, so not validating presence
  
end
