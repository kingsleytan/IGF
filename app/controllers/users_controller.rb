class UsersController < ApplicationController
  # respond_to :js
  before_action :authenticate!, only: [:edit, :update]

  def index
    @user = User.find_by(id: params[:transfer_user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      flash[:success] = "You're registered, welcome!"
    else
      flash[:danger] = @user.errors.full_messages
    end

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = current_user

    if user.update(user_params)
      flash[:success] = "You've updated your details"
    else
      flash[:danger] = user.errors.full_messages
    end

    redirect_to edit_user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :image, :password, :upline).delete_if { |k,v| v.nil? }
  end
end
