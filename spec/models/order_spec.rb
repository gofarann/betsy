require 'rails_helper'

RSpec.describe Order, type: :model do
  describe ".validates" do
    it "must have a status" do
      expect(Order.new(status: nil)).to_not be_valid
    end
  end
end
