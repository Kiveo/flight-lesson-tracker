class SessionsController < ApplicationController 
  
  def new
  end 
  
  def create  
    #omniauth login
    if auth_hash = request.env["omniauth.auth"] 
      @instructor = Instructor.find_or_create_by_omniauth(auth_hash)
      login_sequence
      session[:githubber] = true  
    else #normal login  
      @instructor = Instructor.find_by(cfi: params[:session][:cfi])
      if @instructor && @instructor.authenticate(params[:session][:password])
        login_sequence
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
    #clear user_id and github print
    session.clear
  end

  def login_sequence
    log_in @instructor
    flash[:notice] = "Successfully Logged In."
    redirect_to instructor_path(@instructor)
  end 

end 