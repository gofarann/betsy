class Category < ActiveRecord::Base
  has_many :products, through: :categories_products
  belongs_to :user

  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
  end
  def new
    
  end
  def create
    
  end
  def edit
    
  end
  def update
    
  end
end
