class ProductsController < ApplicationController
  before_action :navbar_categories, only: [:index]
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

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo_url, :stock, :category)
  end
end
