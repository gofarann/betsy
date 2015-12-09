class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end
end
