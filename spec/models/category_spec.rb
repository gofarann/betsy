require 'rails_helper'

RSpec.describe Category, type: :model do

  describe ".validates" do
    it "must have a name" do
      expect(Category.new(name: nil)).to_not be_valid
    end

    it "must have a unique name" do
      @test_category = Category.new(name: "Birthstone")
      @test_category.save
      expect(@test_category).to be_valid
      expect(Category.new(name: "Birthstone")).to_not be_valid
      @test_category.destroy
    end
  end

  describe "top(x)" do

    let(:category) do
      category = Category.create(name: "Some Stuff")
      p = create(:product)
      p2 = create(:product_2)
      category.products << [p, p2]
      return category
    end
    it "returns product instances" do
      expect(category.top(2)[0]).to be_a(Product)
    end
    it "returns x products" do
      expect(category.top(1).length).to eq(1)
      expect(category.top(2).length).to eq(2)
    end
  end
end
