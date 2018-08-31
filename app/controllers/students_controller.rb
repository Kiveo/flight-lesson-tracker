class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @students = Student.all
  end

  def create
    if logged_in?
      @student = Student.new(student_params)
      if @student.save
        respond_to do |format|
          format.html {redirect_to @student}
          format.json {render json: @student, status: 201} #creation success
        end
        flash[:notice] = "Successfully registered student"
      else
        flash[:alert] = @student.errors.full_messages.join(", ")
        redirect_to new_student_path
      end
    else
      redirect_to '/login'
    end
  end

  def show
    find_student
  end

  def edit
    if logged_in?
      find_student
    else
      redirect_to '/login'
    end
  end

  def update
    find_student
    if @student.update(student_params)
      flash[:notice] = "Successfully updated student"
      redirect_to student_path(@student)
    else
      flash[:alert] = @student.errors.full_messages.join(", ")
      redirect_to edit_student_path
    end
  end

  def destroy
    if logged_in?
      Student.find(params[:id]).destroy
      flash[:notice] = "Student successfully removed."
      redirect_to root_url
    else
      redirect_to '/login'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :student_id)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
