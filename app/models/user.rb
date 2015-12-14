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

  # Takes an array of products and returns the x number of products in order of which sold the most often
  def top_selling(product_array, x)
    sales_hash = {}
    product_array.each do |product|
      revenue = product.orderitems.length * product.price
      sales_hash[product] = revenue
    end
    top = sales_hash.sort_by{|k, v| v}
    top_array = top[0..x-1].flatten.reject!{|item| item.class == Fixnum}
    return top_array
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
  def revenue_by_status(status)
    
  end

end
