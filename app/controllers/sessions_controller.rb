class SessionsController < ApplicationController
  def new
  end

  def create
    data = params[:session_data]
    @user = User.find_by_email(data[:email_address])

    if !@user.nil?
      if @user.authenticate(data[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Try Again"
        render :new
      end
    else
      flash[:error] = "Create a new user"
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
