class InstructorsController < ApplicationController
  
  def index
    @instructors = Instructor.all 
  end 

  def new
    if logged_in?
      redirecto_to root_url
    else 
      @instructor = Instructor.new 
    end 
  end 

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save && @instructor.authenticate(params[:password])
      flash[:notice] = 'Instructor successfully registered'
      redirect_to @instructor
    else 
      flash[:notice] = @instructor.errors.full_messages
      redirect_to new_instructor_path
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

  def instructor_params
    params.require(:instructor).permit(:name, :cfi, :password)
  end 

end 

