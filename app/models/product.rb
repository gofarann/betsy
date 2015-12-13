class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, :dependent => :destroy
  has_many :orderitems
  has_many :orders, through: :orderitems
  has_many :categories_products, :dependent => :destroy
  has_many :categories, through: :categories_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0
  validates_numericality_of :stock, :greater_than => 0, on: :create
  # validates :retired, inclusion: { in: %w(false) }, on: :create
  validate :belongs_to_user?


  def belongs_to_user?
    !!self.user
  end

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

  def top_selling
    
  end

end
