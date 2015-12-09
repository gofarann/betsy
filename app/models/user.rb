class User < ActiveRecord::Base
  has_many :orders
  has_many :products
  has_many :categories
end
