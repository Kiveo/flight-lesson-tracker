class Report < ActiveRecord::Base
  belongs_to :instructor

  validates :title, presence: true

  validates :flight_hours, presence: true 
  validates :flight_hours, numericality: true
  
  validates :ground_hours, presence: true 
  validates :ground_hours, numericality: true
  
  scope :most_flight_hours, -> { order("reports.flight_hours DESC")}

end
