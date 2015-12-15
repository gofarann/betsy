class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  # decerements inventory of product
  def item_shipped
    self.status = 'shipped'
    self.product.stock -= 1
    self.product.save
    self.save
  end

end
