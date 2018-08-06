class SessionsController < ApplicationController 

  def new
  end 
  
  def create
    instructor = Instructor.find_by(email: params[:session][:email].downcase)
    if instructor && instructor.authenticate(params[:session][:password])
      log_in instructor
      redirect_to instructor
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end 
  end 

  def delete
    log_out 
    redirect_to root_url
  end 
  
  private 

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end 