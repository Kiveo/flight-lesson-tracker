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
    # raise params.inspect
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @report = @instructor.reports.build(report_params)
    if @report.save
      flash[:notice] = "Report successfully generated"
      redirect_to instructor_report_path(@instructor, @report)
    else 
      flash[:alert] = @report.errors_full_messages.join(", ")
      redirect_to new_instructor_report_path(@instructor) 
    end 
  end

  def show
    # raise params.inspect
    if logged_in?
      @instructor = Instructor.find(params[:instructor_id])
      @report = @instructor.reports.find(params[:id])
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