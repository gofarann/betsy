class ProductsController < ApplicationController
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

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo_url, :stock, :category)
  end
end
