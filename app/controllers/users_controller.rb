class UsersController < ApplicationController
before_action :navbar_categories, only: [:index]
before_action :find_user, only: [:show, :dash, :order_dash]
before_action :only_current_user, only: [:dash, :order_dash]

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

  end

  def dash
  end

  def product_dash
    id = params[:id]
    @user = User.find(id)
  end

  def order_dash
  end

  private

  def strong_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
