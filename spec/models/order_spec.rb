require 'rails_helper'

RSpec.describe Order, type: :model do

  describe ".validates" do

    it "must have a status" do
      expect(build(:order, status: nil)).to_not be_valid
      expect(build(:order)).to be_valid
    end
    #
    # it "must have a credit card name on pay" do
    #   expect(Order.new(no_name_hash)).to_not be_valid
    # end

    # it "must have an email address on pay" do
    #   expect(Order.new(no_email_hash)).to_not be_valid
    # end
    #
    # it "must have a mailing address on pay" do
    #   expect(Order.new(no_mailing_hash)).to_not be_valid
    # end
    #
    # it "must have a credit card num on pay" do
    #   expect(Order.new(no_cc_num_hash)).to_not be_valid
    # end

    # it "must have a credit card expiration date on pay" do
    #   expect(Order.new(no_cc_exp_hash)).to_not be_valid
    # end
    #
    # it "must have a credit card cvv on pay" do
    #   expect(Order.new(no_cc_cvv_hash)).to_not be_valid
    # end
    #
    # it "must have a zip code on pay" do
    #   expect(Order.new(no_zip_hash)).to_not be_valid
    # end

    # it "must have an order item on creation" do
    #   t.integer  "product_id"
    #   t.integer  "order_id"
    #   t.integer  "quantity"
    #     @order = Order.new
    #     @test_order_item = Orderitem.create(product_id: 1, order_id: @)
    # end
  end

  describe "self.pending" do
    it "" do

    end
  end

  describe "decrement_products_stock" do
    it "" do

    end
  end

  describe "total" do
    it "" do

    end
  end

  describe "total_by_user(user_id)" do
    let (:order) do
      order = create(:order)
      p = create(:product)
      p2 = create(:product_2)
      order.products << [p, p2]
      return order
    end
    it "returns an integer" do
      expect(order.total_by_user(1)).to be_a(Integer)
    end
    it "returns the total sales for a given user" do
      expect(order.total_by_user(2)).to eq(2100)
      expect(order.total_by_user(1)).to eq(0)
    end
  end

  describe "mark_shipped?" do
    before :each do
      p = create(:product)
      p2 = create(:product_2)
      @order = Order.pending(p)
      @order.products << p2
      @order.orderitems[0].item_shipped
      @order.mark_shipped

      @order2 = Order.pending(p)
      @order2.products << [p2]
      # @order2.update(good_hash)
      @order2.orderitems[0].item_shipped
      @order2.orderitems[1].item_shipped
      @order2.mark_shipped
    end
    it "marks an order as shipped only if all orderitems are shipped" do
      expect(@order.status).to eq("pending")
      expect(@order2.status).to eq("completed")
    end
  end

  #describe "session_over" do
  #it ""
  #end

  #test that destroying an order destroys its order items

end
