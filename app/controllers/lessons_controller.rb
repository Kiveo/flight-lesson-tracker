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
    # raise params.inspect
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      # raise params.inspect
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
      # raise params.inspect
      flash[:notice] = "Successfully updated lesson."
      redirect_to lesson_path(@lesson)
    else 
      flash[:alert] = @lesson.errors.full_messages
      redirect_to edit_lesson_path
    end  
  end 

  def delete
    if logged_in?
      @lesson = Lesson.find(params[:id])
      if @lesson.destroy
        flash[:notice] = "Lesson Deleted"
        redirect root_url 
      else 
        flash[:notice] = "Failed to delete."
        redirect_to root_url 
    else 
      redirect_to '/login'
    end
  end 
  
  private 

  def lesson_params
    params.require(:lesson).permit(:description, :instructor_id, :student_id, :lesson_datetime )
  end 

end
