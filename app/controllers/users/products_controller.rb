class Users::ProductsController < ApplicationController

  def destroy
    @user = User.find(params[:user_id])
    @user.products.destroy(params[:id])
    redirect_to user_products_dash_path(@user)
  end
end
