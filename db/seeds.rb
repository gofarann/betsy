products = [
  {name:"Emerald Sword", price: "200" , user_id: "1", stock: "2" , photo_url: "http://www.pixelpapercraft.com/files/1351191430408-small.png", description: "Let this delightful emerald sword help you thwack your way through the world." }, 
  {name: "Pure Emerald Block", price: "600", user_id: "12", stock: "25", photo_url: "http://www.pixelpapercraft.com/files/1381466703842.png", description: "Use this lovely emerald block to build all the things."},
  {name: "Fancy Necklace", price: "600", user_id: "14", stock: "22", photo_url: "http://www.faberge.com/images/thumbs/0006090_690.jpeg", description: "Look the best at your next fancy party."},
  {name: "Gaudy Is For Lovers", price: "8000", user_id: "4", stock: "1", photo_url: "http://i.ebayimg.com/00/s/MzAwWDMwMA==/z/ZiYAAOSwnDZUAAOK/$_35.JPG?set_id=2", description: "Bedeck your hands with this one-of-a-kind glory."},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},
  {name: "", price: "", user_id: "", stock: "", photo_url: "", description: ""},

]


categories = [
  {name: "Emerald"},
  {name: "Ruby"},
  {name: "Diamond"},
  {name: "Sapphire"},
  {name: "Quartz"},
  {name: "Amethyst"},
  {name: "Tourmaline"},
  {name: "Jasper"},
  {name: "Turquoise"},
  {name: "Fire Opal"},
  {name: "Azurite"},
]

category_products = [
  {category_id: "1", product_id: "1"},
  {category_id: "1", product_id: "2"},
  {category_id: "1", product_id: "3"},
  {category_id: "1", product_id: "4"},
  {category_id: "2", product_id: "5"},
  {category_id: "2", product_id: "6"},
  {category_id: "2", product_id: "7"},
  {category_id: "2", product_id: "8"},
  {category_id: "2", product_id: "9"},
  {category_id: "2", product_id: "10"},
  {category_id: "2", product_id: "11"},
  {category_id: "2", product_id: "12"},
  {category_id: "2", product_id: "13"},
  {category_id: "2", product_id: "14"},
  {category_id: "2", product_id: "15"},
  {category_id: "3", product_id: "16"},
  {category_id: "3", product_id: "17"},
  {category_id: "3", product_id: "18"},
  {category_id: "3", product_id: "19"},
  {category_id: "3", product_id: "20"},
  {category_id: "11", product_id: "21"},
  {category_id: "11", product_id: "22"},
  {category_id: "11", product_id: "23"},
  {category_id: "11", product_id: "24"},
  {category_id: "11", product_id: "25"},
  {category_id: "4", product_id: "26"},
  {category_id: "4", product_id: "27"},
  {category_id: "4", product_id: "28"},
  {category_id: "4", product_id: "29"},
  {category_id: "4", product_id: "30"},
  {category_id: "5", product_id: "31"},
  {category_id: "5", product_id: "32"},
  {category_id: "5", product_id: "33"},
  {category_id: "5", product_id: "34"},
  {category_id: "5", product_id: "35"},
  {category_id: "5", product_id: "36"},
  {category_id: "5", product_id: "37"},
  {category_id: "5", product_id: "38"},
  {category_id: "6", product_id: "39"},
  {category_id: "6", product_id: "40"},
  {category_id: "6", product_id: "41"},
  {category_id: "6", product_id: "42"},
  {category_id: "6", product_id: "43"},
  {category_id: "6", product_id: "44"},
  {category_id: "7", product_id: "45"},
  {category_id: "7", product_id: "46"},
  {category_id: "7", product_id: "47"},
  {category_id: "7", product_id: "48"},
  {category_id: "7", product_id: "49"},
  {category_id: "7", product_id: "50"},
  {category_id: "8", product_id: "51"},
  {category_id: "8", product_id: "52"},
  {category_id: "8", product_id: "53"},
  {category_id: "8", product_id: "54"}
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