module ApplicationHelper

  def get_all_movies
    Movie.all.map do |movie|
      movie.title
    end
  end

  def is_logged_in?
    if session[:user_id]
      current_user.id == @user.id
    end
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id].to_i)
    end
  end



end
