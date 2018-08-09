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
    if @instructor.save
      flash[:notice] = 'Instructor successfully registered'
      session[:user_id] = @instructor.id 
      redirect_to @instructor 
    else
      flash[:alert] = @instructor.errors.full_messages.join(", ")
      redirect_to new_instructor_path
    end 
  end 

  def show
    if logged_in?
      find_instructor
    else 
      redirect_to root_url
    end 
  end 

  def edit
    find_instructor
    if !logged_in?
      redirect_to root_url
    end  
  end 

  def update
    find_instructor
    if @instructor.update(instructor_params)
      flash[:notice] = "Successfully updated profile" 
      redirect_to root_url 
    else 
      flash[:alert] = @instructor.errors.full_messages
      redirect_to edit_instructor_path
    end 
  end 

  private 

  def instructor_params
    params.require(:instructor).permit(:name, :cfi, :password)
  end 

  def find_instructor
    @instructor = Instructor.find_by_id(session[:user_id])
  end 
  
end 

