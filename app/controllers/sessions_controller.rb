class SessionsController < ApplicationController
  def new
  end

  def create
    data = params[:session_data]
    @user = User.find_by_email_address(data[:email_address])

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
    @current_order = Order.find(session[:order_id])
    @current_order.session_over  #destroys whatever order is in the session so long as it was only pending
    session[:order_id] = nil #not sure if this is needed.
    redirect_to root_path
  end
end
