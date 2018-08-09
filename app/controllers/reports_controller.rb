class ReportsController < ApplicationController

  def new
    if logged_in?
     @report = Report.new
    else 
      redirect_to '/login'
    end 
  end 
  
end