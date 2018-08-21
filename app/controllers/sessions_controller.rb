class SessionsController < ApplicationController

  def new
    @user = User.new
    if current_user
      @user = current_user
      redirect_to user_path(@user)
    end
  end

  def create
    if auth
      @user = User.find_or_initialize_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
      end
      @user.password = SecureRandom.hex(9)
      @user.save
      session[:user_id] = @user.id
      @reviews = @user.reviews
      redirect_to user_path(@user)
    else
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = "That user does not exist, try again, or "
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def session_params
    params.permit(:name, :password)
  end

  def auth
    request.env['omniauth.auth']
  end

end
