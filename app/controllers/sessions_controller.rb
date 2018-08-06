class SessionsController < ApplicationController 

  def new
  end 
  
  def create 
  end 

  def delete
    session.clear 
    redirect_to root_url
  end 
  
end 