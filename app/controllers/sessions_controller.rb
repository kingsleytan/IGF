class SessionsController < ApplicationController
respond_to :js
  def new
  end

  def create
    user = User.find_by(username: user_params[:username])
               &.authenticate(user_params[:password])
    if user
      cookies.permanent.signed[:id] = user.id
      flash[:success] = "Welcome back #{current_user.username}"
      redirect_to root_path
    else
      flash[:danger] = "Error logging in"
      render :new
    end

  end

  def destroy
    cookies.delete(:id)
    flash[:success] = "You've been logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
