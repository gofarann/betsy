class User < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :categories

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email_address, presence: true
  validates :email_address, uniqueness: true

  validates_confirmation_of :password, :message => "Passwords should match"
  has_secure_password

  # returns the top x number of products the user sells based on their average rating
  def top(x)
    products = self.products.where(retired: false).sort_by{|pro| pro.avg_rating}
    return products[0..x-1]
  end

  # returns all the orders that have any products in them belonging to the user
  def orders
    orders = []
    self.products.each do |product|
      product.orders.each do |order|
        orders.push(order)
      end
    end
    return orders
  end

  # returns all the orders a user is associated with, based on the order status
  def orders_by_status(status)
    orders = []
    self.products.each do |product|
      product.orders.each do |order|
        orders.push(order) if order.status == "#{status}"
      end
    end
    return orders
  end

  # returns total revenue for a user
  def revenue
    rev = []
    self.products.each do |product|
      product.orderitems.each do |orderitem|
        rev.push(orderitem.product.price)
      end
    end
    total = rev.inject{|r, e| r + e}
    return total
  end

  # returns revenue for user by order status
  def rev_by_status(status)
    rev = []
    orders = self.orders_by_status(status)
    orders.each do |order|
      order.orderitems.each do |orderitem|
        rev.push(orderitem.product.price)
      end
    end

    total = rev.inject{|r, e| r + e}
    return total
  end

end
