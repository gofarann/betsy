class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def self.destroy_order
    Orderitem.transaction do
      order = Order.new(status: 'pending')
      order.products << first_product
      order.save!
    end
  end

end
