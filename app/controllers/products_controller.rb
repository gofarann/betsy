class ProductsController < ApplicationController
  before_action :navbar_categories, only: [:index]

  def buy
    #a.k.a add to cart
    #in views, have to make it so clicking "buy" button to buy enters a product_id into params
    id = params[:id]
    @product = Product.find(id)
    #if there is not yet an order_id in session, make it now
    #this is totally independent of being logged in.
    session[:order_id] ||= []
    #then if the id is nil, make an order and put it's id in the session hash
    #if there already is an order in the session, add the product to it.
      if session[:order_id] == []
        @order = Order.pending(@product)
        session[:order_id] = @order.id
      else
        @order = Order.find(session[:order_id])
        #logic for whether or not one is in cart already
        if @order.orderitems.where(product_id: @product.id) != []
          #product is already in order
          @orderitem = @order.orderitems.where(product_id: @product.id).first
          @orderitem.update_attribute(:quantity, @orderitem.quantity + 1 )
        else
          #product is not already in order
          @orderitem = Orderitem.create(quantity: 1, order_id: @order.id, product_id: @product.id)
        end
      end
      #in any case, want to stay on same page after clicking button
      redirect_to request.referrer
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    id = params[:id]
    @product = Product.find(id)
    @title = "#{@product.name} Info"
    @stars = @product.avg_rating
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
    @action = "update"
    @title = "Edit #{@product.name}"
  end

  def update
    @product = Product.update(params[:id], product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.destroy(params[:id])
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo_url, :stock, :category)
  end
end
