class LessonsController < ApplicationController
  
  def index
    @lessons = Lesson.all 
  end 

  def new
    if !logged_in?
      redirect_to '/login'
    else 
      @lesson = Lesson.new 
      @students = Student.all 
      @instructors = Instructor.all 
    end  
  end 

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Successfully created lesson."
      redirect_to lesson_path(@lesson)
    else 
      flash[:alert] = @lesson.errors.full_messages
      redirect_to new_lesson_path
    end  
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
      flash[:notice] = "Successfully updated lesson."
      redirect_to lesson_path(@lesson)
    else 
      flash[:alert] = @lesson.errors.full_messages.join(", ")
      redirect_to edit_lesson_path
    end  
  end 

  # To be enabled as a feature in further cycle. Instructors will require admin priviledges to delete lesson
  def destroy
    if logged_in?
      @lesson = Lesson.find(params[:id])
      if @lesson.destroy
        flash[:notice] = "Lesson Deleted"
        redirect_to lessons_url 
      else 
        flash[:alert] = "Failed to delete."
        redirect_to lessons_url 
      end 
    else 
      redirect_to '/login'
    end
  end 
  
  private 

  def lesson_params
    params.require(:lesson).permit(:description, :instructor_id, :student_id, :lesson_datetime )
  end 

end
