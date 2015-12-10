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
end
