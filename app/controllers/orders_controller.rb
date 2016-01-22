class OrdersController < ApplicationController
  #look up callbacks
  #also, in order to make filter work, buttons to do stuff to orders need to send an id into params. (see guest_authorize method, which uses id)
  #this is to help make it so only the person who started an order can do stuff to it.
  before_action :guest_authorize, :only =>[:clear_cart, :cancel_as_guest, :pay]
  before_action :navbar_categories, only: [:cart]


  #the order from the perspective of the merchant
  def show
    @order = Order.find(params[:id])
  end

  #the order from the perspective of the guest
  #stuff needed to view the cart page
  def cart
    if !session[:order_id]
      @cart_status = "empty"
    end
  end

  #before you pay, clearing cart destroys order and orderitems.
  #after you've paid, you instead cancel the order, and the order sticks around in the database
  def clear_cart
    @order = Order.find(session[:order_id])
    @order.destroy!
    session[:order_id] = nil
    redirect_to root_path
  end

  def checkout
    @order = Order.find(session[:order_id])
  end

  def confirm
    @order = Order.find(session[:order_id])

    user_orderitems = {}
    @order.orderitems.each do |oi|
      if user_orderitems[oi.product.user.username].nil?
        user_orderitems[oi.product.user.username] = [oi]
      else
        user_orderitems[oi.product.user.username] = user_orderitems[oi.product.user.username].push(oi)
      end
    end

    boxes = []
    volume = 0
    user_orderitems.each do |store, order_items|
      volume = 0
      weight = 0
      order_items.each do |oi|
        volume += ((oi.product.length ** 3.0) * oi.quantity)
        weight += (oi.product.weight * oi.quantity)
        @user = oi.product.user
      end
      boxes.push({weight: weight, size: (volume ** (1/3.0)).ceil , merchant: @user.id})
    end
    @boxes = boxes

    @shipping_info = []
    @boxes.each do |box|
      @merchant = User.find(box[:merchant])
      r = HTTParty.get("http://localhost:3000/rates?destination_address[country]=US&destination_address[state]=#{@order.state}&destination_address[city]=#{@order.city}&destination_address[zip]=#{@order.zip}&origin_address[country]=US&origin_address[state]=#{@merchant.state}&origin_address[city]=#{@merchant.city}&origin_address[zip]=#{@merchant.zip}&package[weight]=#{box[:weight]}&package[length]=#{box[:size]}&package[width]=#{box[:size]}&package[height]=#{box[:size]}&package[units]=metric",
      headers: { 'Accept' => 'application/json' }, format: :json).parsed_response

      @shipping_info.push(r)
    end

    # do something to display the shipping info on the view
  end

  def cancel_as_guest
    @order = Order.find(session[:order_id])
    @order.update_attribute(:status, "cancelled")
    session[:order_id] = nil
    @cart_status = "empty"
    redirect_to root_path
  end

  def finalize
    @order = Order.find(session[:order_id])
    @order.decrement_products_stock
    session[:order_id] = nil
    @cart_status = "empty"
    flash[:notice] = "Thank you for your order!"
    redirect_to root_path
  end

  def pay
    @order = Order.find(session[:order_id])
    @order.update(order_params[:order])
    @order.placed_at = Time.now
    @order.status =  "paid"
    @order.save!
    redirect_to order_confirm_path(@order.id)
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
    order.update_attributes(order_params[:order])
    redirect_to order_path(params[:id])
  end

  private

  def order_params
    params.permit(order:[:status, :cc_name, :email_address, :mailing_address, :cc_number, :cc_exp, :cc_cvv, :zip, :placed_at, :city, :state, :zip])
  end

  #views will need to make sure they send in an id to use here
  def guest_authorize
    unless session[:order_id]
    redirect_to root_path
    end
  end

end
