class ReportsController < ApplicationController
  
  def index
    if logged_in?
      @instructor = Instructor.find(current_user)
      if !params[:hour_type].blank?
        if params[:hour_type] == "Flight"
          @reports = @instructor.reports.most_flight_hours
        elsif params[:hour_type] == "Ground"
          @reports = @instructor.reports.most_ground_hours
        elsif params[:hour_type] == "Recently Created" 
          @reports = @instructor.reports.recent
        else 
          @reports = @instructor.reports.recently_updated
        end
      else # Default
        @reports = Instructor.find(current_user).reports
      end
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
    if logged_in? 
      @instructor = Instructor.find(params[:instructor_id])
      @report = @instructor.reports.find(params[:id])
      if !current_user.reports.detect{|report| report == @report }
        flash[:notice] = "Can not view reports that are not yours."
        redirect_to root_url
      end 
    else 
      redirect_to '/login'
    end
  end

  def edit
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @report = @instructor.reports.find(params[:id])
    if !current_user.reports.detect{|report| report == @report }
        flash[:notice] = "Can not view reports that are not yours."
    end 
  end

  def update
    @instructor = Instructor.find_by_id(current_user)
    @report = @instructor.reports.find(params[:id])
    if @report.update(report_params)
      flash[:notice] = "Report successfully updated"
      redirect_to instructor_reports_path(@instructor)
    else 
      flash[:alert] = @report.errors_full_messages.join(", ")
      redirect_to edit_instructor_report_path(@instructor, @report) 
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