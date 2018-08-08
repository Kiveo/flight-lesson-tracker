module WelcomeHelper

  def greeting_options(current_user)
    if logged_in?
      "Welcome, #{current_user.name}"
    else
      'Welcome page!'
    end
  end 
  
end

