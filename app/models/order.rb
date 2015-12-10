class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems
  has_many :products

  # validates_numericality_of :orderitems, :greater_than_or_equal_to => 1
end
