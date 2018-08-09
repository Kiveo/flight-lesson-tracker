class SessionsController < ApplicationController 
  
  def new
  end 
  
  def create  
    #omniauth login
    if auth_hash = request.env["omniauth.auth"] 
      @instructor = Instructor.find_or_create_from_auth_hash(auth_hash)
      log_in @instructor
      flash[:notice] = "Welcome Back!"
      redirect_to instructor
    else #normal login  
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

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end 