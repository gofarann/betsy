require 'rails_helper'

RSpec.describe Category, type: :model do

    describe ".validates" do
      it "must have a title" do
        expect(model.new(title: nil, ranking: 0)).to_not be_valid
      end

      it "must have a ranking" do
        expect(model.new(title: "t", ranking: nil)).to_not be_valid
      end

      it "must have a ranking of zero on creation" do
        expect(model.new(title: "t", ranking: 1)).to_not be_valid
        expect(model.new(title: "t", ranking: 0)).to be_valid
      end
    end

end
