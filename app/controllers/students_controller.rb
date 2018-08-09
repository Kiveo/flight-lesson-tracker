class StudentsController < ApplicationController
  
  def index
  end 

  def new
    @student = Student.new 
  end 

  def create
    if logged_in?
      @student = Student.new(student_params)
      if @student.save 
        flash[:notice] = "Successfully registered student"
        redirect_to student_path(@student)
      else 
        flash[:alert] = @student.errors.full_messages.join(", ")
        render new_student_path
      end
    else 
      redirect_to '/login'
    end  
  end 

  def show
  end 

  def edit
  end 

  def update 
  end 

  def delete
  end 
  
  private 

  def student_params
    params.require(:student).permit(:name)
  end 
  
end 
