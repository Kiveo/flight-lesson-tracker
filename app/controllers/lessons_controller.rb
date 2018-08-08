class LessonsController < ApplicationController
  
  def index
    @lessons = Lesson.all 
  end 

  def new
  end 

  def create
  end 

  def show
  end 

  def edit
    @lesson = Lesson.find(params[:id])
    @students = Student.all 
    @instructors = Instructor.all 
  end 

  def update 
  end 

  def delete
  end 
  
end
