class Category < ActiveRecord::Base
  has_many :products, through: :categories_products
  belongs_to :user
end
