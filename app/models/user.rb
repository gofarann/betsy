class User < ActiveRecord::Base
  has_many :orders
  has_many :products
  has_many :categories

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates_confirmation_of :password, :message => "Passwords should match"
  has_secure_password
end
