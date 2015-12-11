class User < ActiveRecord::Base
  has_many :orders
  has_many :products
  has_many :categories

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email_address, presence: true
  validates :email_address, uniqueness: true

  validates_confirmation_of :password, :message => "Passwords should match"
  has_secure_password

  def top(x)
    products = self.products.sort_by{|pro| pro.avg_rating}
    return products[0..x]
  end
  
end
