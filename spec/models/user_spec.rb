require 'rails_helper'

RSpec.describe User, type: :model do
  let(:good_hash) do {
    username: "Burp",
    email_address: "thing@thing.com",
    password: "this",
    password_confirmation: "this"
  }
  end
  let(:product_hash) do
     {name: "Geometry Like Woah",
      price: 20,
      stock: "1",
      photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
      description: "I drew this just for you.",
      retired: "false"
    }
  end
  let(:second_product) do
     {name: "Another Product",
      price: 25,
      stock: "2",
      photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
      description: "I drew this just for you.",
      retired: "false"
    }
  end
  # create a let for some some orders

  describe "top(x)" do
    let(:user) do
      user = User.create(good_hash)
      p = Product.create!(product_hash)
      p2 = Product.create!(second_product)
      user.products << [p, p2]
      return user
    end
    it "returns product instances" do
      expect(user.top(2)[0]).to be_a(Product)
    end
    it "returns x products" do
      expect(user.top(1).length).to eq(1)
      expect(user.top(2).length).to eq(2)
    end
  end

  describe "revenue" do
    let(:user) do
      user = User.create(good_hash)
      p = Product.create!(product_hash)
      p2 = Product.create!(second_product)
      user.products << [p, p2]
      order = Order.pending(p)
      order2 = Order.pending(p2)
      return user
    end
    # create an order
    it "returns an integer" do
      expect(user.revenue).to be_a(Integer)
    end
    it "returns total of all products that have been orderitems" do
      expect(user.revenue).to eq(45)
    end
  end

  describe "rev_by_status" do
  let(:paid_order) do  { 
        status: "paid",
        cc_name: "Kelly Phelly",
        email_address: "kelly@kellkell.com",
        mailing_address: "848 Magpie Lane",
        cc_number: 340727812705850,
        cc_exp: "03/11",
        cc_cvv: "454",
        zip: 94983,
        placed_at: rand(1.year.ago..Time.now)
      }
    end
    let(:user) do
      user = User.create(good_hash)
      p = Product.create!(product_hash)
      p2 = Product.create!(second_product)
      user.products << [p, p2]
      order = Order.pending(p)
      order2 = Order.pending(p2)
      order2.update(paid_order)
      order2.save
      return user
    end
    #create orders of various statuses
    it "returns an integer" do
      expect(user.rev_by_status('pending')).to be_a(Integer)
    end
    it "returns total sales of products from orders with given status"  do
      expect(user.rev_by_status('pending')).to eq(20)
      expect(user.rev_by_status('paid')).to eq(25)
    end
  end
  
end
