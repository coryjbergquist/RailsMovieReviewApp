class MovieReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def self.controller_path
    'reviews'
  end

  def index
    @movie = Movie.find(params[:movie_id])
    render 'movies/show'
  end

  def new
    @review = Review.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.reviews.build(movie_reviews_params)
    @movie.reviews.last.user_id = current_user.id
    @movie.save
    redirect_to review_path(@movie.reviews.last)
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find_by(id: params[:id])
    @user = current_user
    #render 'movies/show'
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    if is_logged_in? && @review.user.id == current_user.id
      render 'reviews/edit'
    else
      flash[:notice] = "You cannot edit this review"
      render review_path(@review)
    end
  end

  def update
    @user = current_user
    @review = Review.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    @review.update(movie_reviews_params)
    redirect_to movie_review_path(@movie.id, @review.id)
  end



  private

  def movie_reviews_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def handle_record_not_found
  # Send it to the view that is specific for Post not found
    redirect_to 'index'
  end

end
