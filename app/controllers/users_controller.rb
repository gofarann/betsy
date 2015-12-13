class UsersController < ApplicationController
before_action :navbar_categories, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    find_user
  end

  def dash
    
  end

  private

  def strong_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
