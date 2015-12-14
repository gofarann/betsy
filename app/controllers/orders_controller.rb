class OrdersController < ApplicationController
  #look up callbacks
  #also, in order to make filter work, buttons to do stuff to orders need to send an id into params. (see guest_authorize method, which uses id)
  #this is to help make it so only the person who started an order can do stuff to it.
  before_action :guest_authorize, :only =>[:clear_cart, :cancel_as_guest, :pay]


  #I don't think this needs to exist.
  # def index
  #   @orders = Order.all
  # end

  #the order from the perspective of the merchant
  def show
    @order = Order.find(params[:id])
  end

  #the order from the perspective of the guest
  #stuff needed to view the cart page
  def cart
    if !session[:order_id]
      @cart_status = "empty"
    else
    @order = Order.find(session[:order_id])
    end
  end

  #before you pay, clearing cart destroys order and orderitems.
  #after you've paid, you instead cancel the order, and the order sticks around in the database
  def clear_cart
    @order = Order.find(session[:order_id])
    @order.destroy
    session[:order_id] = nil
    redirect_to root_path
  end

  def checkout
    #stuff needed to view the checkout page
  end

  def confirm
    #stuff needed on the confirmation page
  end

  def cancel_as_user
      @order = Order.find(params[:id])
      @order.update_attribute(:status, "cancelled")
      redirect_to order_sum_path(session[:user_id])
  end

  def cancel_as_guest
    @order = Order.find(session[:order_id][0])
    @order.update_attribute(:status, "cancelled")
    redirect_to root_path
  end

  def ship
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "complete")
    redirect_to root_path
  end


  def pay
    @order = Order.find(session[:order_id][0])
    @order = Order.update(cc_name: order_params[:order][:cc_name],
                        email_address: order_params[:order][:email_address],
                        mailing_address: order_params[:order][:mailing_address],
                        cc_number: order_params[:order][:cc_number],
                        cc_exp: order_params[:order][:cc_exp],
                        cc_cvv: order_params[:order][:cc_cvv],
                        zip: order_params[:order][:zip],
                        status: "paid")
    redirect_to root_path
  end


  #edit and update... are for the guest to do on the cart page?
  #needs more thought
  #we have lots of specific ways we are updating, as it stands right now
  def edit
    @order = Order.find(params[:id])
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.update_attributes(order_params)
    redirect_to order_path(params[:id])
  end

  #Maybe we could have merchant be able to delete cancelled orders if they want to.
  #not sure about how we are using this one yet
  def destroy
    Order.destroy(params[:id])
    redirect_to orders_path
  end

  private

  def order_params
    params.permit(order:[:status, :cc_name, :email_address, :mailing_address, :cc_number, :cc_exp, :cc_ccv, :zip, :placed_at])
  end

  #views will need to make sure they send in an id to use here
  def guest_authorize
    unless session[:order_id]
    redirect_to root_path
    end
  end

end
