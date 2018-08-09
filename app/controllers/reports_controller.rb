class ReportsController < ApplicationController

  
  def index
    if logged_in?
      @reports = Instructor.find_by(params[:instructor_id]).reports
    else
      redirect_to '/login'
    end
  end

  def new
    if logged_in?
     @instructor = Instructor.find(current_user.id)
     @report = @instructor.reports.build
    else 
      redirect_to '/login'
    end 
  end 
 
  def show
    if logged_in?
      @report = report.find(params[:id])
    else 
      redirect_to '/login'
    end
  end

end