class OrdersController < ApplicationController
  #look up callbacks
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.update_attributes(order_params)
    redirect_to order_path(params[:id])
  end

  def destroy
    Order.destroy(params[:id])
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :cc_name, :email_address, :mailing_address, :cc_number, :cc_exp, :cc_ccv, :zip, :placed_at)
  end
end
