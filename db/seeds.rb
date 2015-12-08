# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = [
  {name:"", price: , user_id: , stock: , photo_url: "", descrption: "" }, 
  {}
]

categories = [
  {},
]

order_items = [
  {},
]

products.each do |p|
  Product.create(p)
end

categories.each do |c|
  Category.create(c)
end

order_items.each do |o|
  OrderItem.create(o)
end

users.each do |u|
  User.create(u)
end

orders.each do |o|
  Order.create(o)
end

item.each do |i|
  Item.create(i)
end

category_products.each do |c|
  CategoryProduct.create(c)
end