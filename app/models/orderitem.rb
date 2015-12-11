class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  # validates :order_id, presence: true
  validates :product_id, presence: true

  after_validation :set_order

  protected
    def set_order
      self.order_id = Order.all.last.id
    end

end
