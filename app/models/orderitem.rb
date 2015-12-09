class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order_id, presence: true
  validates :product_id, presence: true

  validates :order_item, numericality: { only_integer: true }
  validates_numericality_of :order_item, :greater_than => 0
end
