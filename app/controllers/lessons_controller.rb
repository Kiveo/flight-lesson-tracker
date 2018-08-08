class LessonsController < ApplicationController
  
  def index
    @lessons = Lesson.all 
  end 

  def new
  end 

  def create
  end 

  def show
    @lesson = Lesson.find(params[:id])
  end 

  def edit
    if logged_in?
      @lesson = Lesson.find(params[:id])
      @students = Student.all 
      @instructors = Instructor.all
    else 
      redirect_to '/login'
    end  
  end 

  def update
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Successfully updated lesson."
      redirect_to lesson_path(@lesson)
    else 
      flash[:alert] = "Invalid Data, please try again."
      render lesson_edit_path(@lesson)
    end  
  end 

  def delete
  end 
  
  private 

  def lesson_params
    params.require(:lesson).permit(:description, :instructor_id, :student_id)
  end 

end
