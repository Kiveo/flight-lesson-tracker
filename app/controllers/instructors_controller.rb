class InstructorsController < ApplicationController
  
  def index
    @instructors = Instructor.all 
  end 

  def new
    @instructor = Instructor.new 
  end 

  def create
  end 

  def show
  end 

  def edit
  end 

  def update 
  end 

  def delete
  end 

end 

