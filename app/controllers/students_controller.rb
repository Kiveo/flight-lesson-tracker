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
        # raise params.inspect 
        flash[:alert] = @student.errors.full_messages.join(", ")
        redirect_to new_student_path
      end
    else 
      redirect_to '/login'
    end  
  end 

  def show
    @student = Student.find(params[:id])
  end 

  def edit
  end 

  def update 
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
  
end 
