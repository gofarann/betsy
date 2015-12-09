class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :products

  validates_numericality_of :order_items, :greater_than_or_equal_to => 1
end
