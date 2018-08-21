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
    @review = Review.new(reviews_params)
    @user = current_user
    @review.user_id = @user.id
    @review.movie_id = @movie.id if @movie
    if @review.save
      redirect_to user_path(@user)
    else
      @user = current_user
      flash[:notice] = @review.errors.full_messages.each do |message|
        message
      end
      render "new"
    end
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
    @movie = Movie.find_by(id: @review.movie_id)
    if is_logged_in?

    else
      flash[:notice] = "You cannot edit this review"
      render review_path(@review)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(reviews_params)
  end

  def show
    @review = Review.find(params[:id])
    @movie = @review.movie
    @user = @review.user
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :content, :rating)
  end

end
