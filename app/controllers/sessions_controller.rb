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
    session[:user_id] = nil if session[:user_id]
    if !!session[:order_id]
      error
      @current_order = Order.find(session[:order_id])
      @current_order.destroy!  #destroys whatever order is in the session so long as it was only pending, which is done in an order validation
      session[:order_id] = nil
    end
    redirect_to root_path
  end
end
