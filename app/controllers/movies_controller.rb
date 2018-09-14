class MoviesController < ApplicationController
  helper_method :params

  def index
    if session[:user_id]
      @user = current_user
    end
    @movies = Movie.order(:title)
    @reviews = Review.last(5).reverse
  end

  def show
    @movie = Movie.find(params[:id])
  end

  # def update
  #   @movie = Movie.find(params[:id])
  #   @movie.update(params[:movie][:reviews])
  # end

  def top_movies
    @movies = Movie.top_movies
    render 'top_movies.html.erb'
  end

  def movie_data
    movie = Movie.find(params[:id])
    render json: movie.reviews, status: 200
  end

private

  def movies_params
    params.require(:movie).permit(:reviews, :title, :content)
  end


end
