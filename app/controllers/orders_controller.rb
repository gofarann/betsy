class OrdersController < ApplicationController
  #look up callbacks
  #BEWARE of trying to dry out with before actions- read carefully- @order is sometimes found by session, sometimes by params

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def cart
    #stuff needed to view the cart page
  end

  #before you pay, clearing cart destroys order and orderitems.
  #after you've paid, you instead cancel the order, and the order sticks around in the database
  def clear_cart
    Order.destroy(session[:order_id])
  end

  def checkout
    #stuff needed to view the checkout page
  end

  def confirm
    #stuff needed on the confirmation page
  end

  def create
    #clicking on "buy" on a product for the first time in a session does this

  end

  def cancel
    #for now, this is for guests.
    #Could do some logic and make it so users can cancel people's orders for them as a customer service thing.
    @order = Order.find(session[:order_id])
    @order.update_attribute(:status, "cancelled")
    redirect_to root_path
  end

  def ship
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "complete")
    redirect_to root_path
  end


  def pay
    @order = Order.find(session[:order_id])
    @order = Order.update(cc_name: order_params[:order][:cc_name],
                        email_address: order_params[:order][:email_address],
                        mailing_address: order_params[:order][:mailing_address],
                        cc_number: order_params[:order][:cc_number],
                        cc_exp: order_params[:order][:cc_exp],
                        cc_cvv: order_params[:order][:cc_cvv],
                        zip: order_params[:order][:zip],
                        status: "paid")
  end

  #edit and update... are for the guest to do on the cart page?
  #needs more thought
  def edit
    @order = Order.find(params[:id])
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.update_attributes(order_params)
    redirect_to order_path(params[:id])
  end

  #Not really used. Maybe we could have merchant be able to delete cancelled orders if they want to.
  def destroy
    Order.destroy(params[:id])
    redirect_to orders_path
  end

  private

  def order_params
    params.permit(order:[:status, :cc_name, :email_address, :mailing_address, :cc_number, :cc_exp, :cc_ccv, :zip, :placed_at])
  end

end
