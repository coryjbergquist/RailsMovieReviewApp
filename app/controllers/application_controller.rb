class ApplicationController < ActionController::Base

  def is_logged_in?
    current_user.id == @user.id
  end

  def current_user
    User.find(session[:user_id].to_i)
  end

end
