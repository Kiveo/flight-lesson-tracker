class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @lessons, status: 200}
    end
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
    respond_to do |format|
      format.html { render :show }
      format.json {render json: @lesson, status: 200}
    end
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

  private

  def lesson_params
    params.require(:lesson).permit(:description, :instructor_id, :student_id, :lesson_datetime )
  end

end
