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
    if @movie && !params[:review][:content]
      @review = Review.new
      render "new"
    elsif @movie && params[:review][:content]
      @user = current_user #check against params id and session user_id?
      @review = Review.new(title: params[:review][:title], content: params[:review][:content], rating: params[:review][:rating])
      @review.user_id = @user.id
      @review.movie_id = @movie.id
      if @review.save
        redirect_to user_path(@user)
      else
        flash[:notice] = @review.errors.full_messages.each do |message|
          message
        end
      end
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
    #finish edit form and update/patch controller methods
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
    params.require(:review).permit(:title, :content, :rating, :movie)
  end

end
