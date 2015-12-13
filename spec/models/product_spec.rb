require 'rails_helper'

RSpec.describe Product, type: :model do
  describe ".validates" do
    let(:good_hash) do
      {name: "Geometry Like Woah",
       price: 5645245,
       user_id: "2",
       stock: "1",
       photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
       description: "I drew this just for you.",
       retired: false
     }
    end

    let (:no_name_hash) do
      {name: nil,
       price: 5645245,
       user_id: "2",
       stock: "1",
       photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
       description: "I drew this just for you."
      }
    end

    let (:no_price_hash) do
      {
       name: "Harry",
       price: nil,
       user_id: "2",
       stock: "1",
       photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
       description: "I drew this just for you."
      }
    end

    let (:price_of_zero) do
      {
        name: "Harry",
        price: 0,
        user_id: "2",
        stock: "1",
        photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
        description: "I drew this just for you."
      }
    end

    let (:price_not_a_number) do
      {
        name: "Harry",
        price: "two dollars",
        user_id: "2",
        stock: "1",
        photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
        description: "I drew this just for you."
      }
    end

    let (:no_user_id_hash) do
      {
        name: "Harry",
        price: 435345,
        user_id: nil,
        stock: "1",
        photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
        description: "I drew this just for you."
      }
    end

    let (:stock_of_zero) do
      {
        name: "Harry",
        price: 435345,
        user_id: "2",
        stock: 0,
        photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
        description: "I drew this just for you."
      }
    end

    let (:retired) do
      {
        name: "Harry",
        price: 435345,
        user_id: "2",
        stock: 0,
        photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
        description: "I drew this just for you.",
        retired: true
      }
    end

    let (:not_retired) do
      {
        name: "Harry",
        price: 435345,
        user_id: "2",
        stock: 0,
        photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay",
        description: "I drew this just for you.",
        retired: false
      }
    end

    it "must have a name" do
      expect(Product.new(good_hash)).to be_valid
      expect(Product.new(no_name_hash)).to_not be_valid
    end
#
    it "must have a unique name" do
      @test_product = Product.new(good_hash)
      @test_product.save
      expect(@test_product).to be_valid
      expect(Product.new(good_hash)).to_not be_valid
      @test_product.destroy
    end

    it "must have a price" do
      expect(Product.new(no_price_hash)).to_not be_valid
    end

    it "must have a price that is a number" do
      expect(Product.new(price_not_a_number)).to_not be_valid
    end

    it "must have a price greater than zero" do
      expect(Product.new(price_of_zero)).to_not be_valid
    end

    it "has a stock greater than zero on create" do
      expect(Product.new(stock_of_zero)).to_not be_valid
    end

    it "must belong to a User" do
      expect(Product.new(no_user_id_hash)).to_not be_valid
    end

    it "upon creation is not retired" do
      expect(Product.new(retired)).to_not be_valid
      expect(Product.new(not_retired)).to be_valid
    end

    it "is retired with (insert method here to test?)" do
    end

    #test that destroying a product destroys its reviews

  end

  describe "belongs_to_user?" do
    it "" do
      
    end
  end

  describe "avg_rating" do
    it "" do
      
    end
  end

end
