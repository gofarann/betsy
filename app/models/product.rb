class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :order_items
  has_many :categories, through: :categories_products

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0

  # validates :user_id, presence: true

  validates_numericality_of :stock, :greater_than => 0
end
