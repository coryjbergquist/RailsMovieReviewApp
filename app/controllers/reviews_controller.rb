class ReviewsController < ApplicationController

  def index
    @review = Review.new
    @movies = Movie.order(:title)
    @reviews = Review.last(5).reverse
  end

  def new
    @user = current_user
    @review = Review.new
  end

  def create
    @movie = Movie.find_by(title: params[:review][:movie])
    @review = @movie.reviews.build(reviews_params)
    if @review.save
      redirect_to user_path(current_user)
    else
      @user = current_user
      flash[:notice] = @review.errors.full_messages.join(", ")
      render "new"
    end
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
    @movie = @review.movie
    redirect_to edit_movie_review_path(@movie, @review)
  end


  def show
    @review = Review.find(params[:id])
    @movie = @review.movie
    @user = @review.user
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :content, :rating).merge(user_id: current_user.id, movie_id: @movie.id)
  end

end
