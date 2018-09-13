class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.each do |message|
        message
      end
      render 'users/new'
    end
  end

  def show
      @user = User.find(params[:id])
    if is_logged_in?
      @user = User.find(session[:user_id])
      @user.admin = true if params[:admin]
      @reviews = @user.reviews.last(5).reverse
      render 'users/show'
    else
      render 'users/show'
    end
  end

  def user_data
    user = User.find(params[:id])
    #render json: PostSerializer.serialize(post)
    render json: user.reviews.to_json(only: [:title, :content, :id, :movie_id],
                                      #include: {user: {only: :name}}
                                      )
  end

  private

  def users_params
    params.require(:user).permit(:name, :password)
  end

end
