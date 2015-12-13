class User < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :categories

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email_address, presence: true
  validates :email_address, uniqueness: true

  validates_confirmation_of :password, :message => "Passwords should match"
  has_secure_password

  def top(x)
    products = self.products.where(retired: false).sort_by{|pro| pro.avg_rating}
    return products[0..x-1]
  end

  def orders
    orders = []
    self.products.each do |product|
      product.orders.each do |order|
        orders.push(order)
      end
    end
    return orders
  end

end
