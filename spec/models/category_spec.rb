require 'rails_helper'

RSpec.describe Category, type: :model do

  describe ".validates" do
    it "must have a name" do
      expect(Category.new(name: nil)).to_not be_valid
    end

    it "must have a unique name" do
      @category = Category.new(name: "Birthstone")
      @category.save
      expect(@category).to be_valid
      expect(Category.new(name: "Birthstone")).to_not be_valid
    end
  end

end
