class SessionsController < ApplicationController 
  
  def new
  end 
  
  def create #instructors will likely have a unique FAA CFI number 
    instructor = Instructor.find_by(cfi: params[:session][:cfi])
    if instructor && instructor.authenticate(params[:session][:password])
      log_in instructor
      flash[:notice] = "Successfully Logged In."
      redirect_to instructor
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end 
  end 

  def delete
    log_out 
    redirect_to root_url
  end 
  
  private 

  def log_in(instructor)
    session[:user_id] = instructor.id
  end

  def log_out
    session.delete(:user_id)
  end
end 