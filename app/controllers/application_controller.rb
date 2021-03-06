class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user


  private 

  def logged_in?
    !!session[:user_id]
  end 

  def current_user
    @current_user ||= Instructor.find_by_id(session[:user_id])
  end 

end
