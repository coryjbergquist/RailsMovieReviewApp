module ApplicationHelper

  def get_all_movies
    Movie.all.map do |movie|
      movie.title
    end
  end

  def is_logged_in?
    current_user == @user.id
  end

  def current_user
    session[:user_id]
  end



end
