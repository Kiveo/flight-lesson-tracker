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
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      # raise params.inspect
      flash[:notice] = "Successfully updated lesson."
      redirect_to lesson_path(@lesson)
    else 
      flash[:alert] = @lesson.errors.full_messages
      redirect_to edit_lesson_path
    end  
  end 

  def delete
  end 
  
  private 

  def lesson_params
    params.require(:lesson).permit(:description, :instructor_id, :student_id, :lesson_datetime )
  end 

end
