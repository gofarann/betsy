class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :order_items
  has_many :categories_products
  has_many :categories, through: :categories_products

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0

  # validates :user_id, presence: true

  validates_numericality_of :stock, :greater_than => 0

  
  def avg_rating
    total = 0
    self.reviews.each do |r|
      total += r.rating
    end
    if self.reviews.length > 0
      avg = total / self.reviews.length
    else 
      avg = 0
    end
    return avg
  end

end
