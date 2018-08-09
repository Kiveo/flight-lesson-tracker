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
 
  def create
  end

  def show
    if logged_in?
      @report = report.find(params[:id])
    else 
      redirect_to '/login'
    end
  end

  def destroy
    if logged_in?
      @instructor = Instructor.find(params[:instructor_id])
      @report = @instructor.reports.find(params[:id])
      @report.destroy
      flash[:notice] = "Report successfully removed."
      redirect_to instructor_path(@instructor)
    else 
      redirect_to '/login'
    end  
  end

  private 

  def report_params
    params.require(:report).permit(:title, :flight_hours, :ground_hours)
  end 

end