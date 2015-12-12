require 'rails_helper'

RSpec.describe Order, type: :model do
  describe ".validates" do
    let(:good_hash) do
    {
      status: "pending",
      cc_name: "John Carlisle",
      email_address: "jcarl@gmail.com",
      mailing_address: "653 Gorge Way",
      cc_number: 5110538084994719,
      cc_exp: "06/18",
      cc_cvv: "674",
      zip: 19583
    }
    end

    let (:no_status_hash) do
      {
        status: nil,
        cc_name: "John Carlisle",
        email_address: "jcarl@gmail.com",
        mailing_address: "653 Gorge Way",
        cc_number: 5110538084994719,
        cc_exp: "06/18",
        cc_cvv: "674",
        zip: 19583
      }
    end

  #   let (:no_name_hash) do
  #     {
  #       status: "pending",
  #       cc_name: nil,
  #       email_address: "jcarl@gmail.com",
  #       mailing_address: "653 Gorge Way",
  #       cc_number: 5110538084994719,
  #       cc_exp: "06/18",
  #       cc_cvv: "674",
  #       zip: 19583
  #     }
  #   end
  #
  #   let (:no_email_hash) do
  #     {
  #       status: "pending",
  #       cc_name: "John",
  #       email_address: nil,
  #       mailing_address: "653 Gorge Way",
  #       cc_number: 5110538084994719,
  #       cc_exp: "06/18",
  #       cc_cvv: "674",
  #       zip: 19583
  #     }
  #   end
  #
  #   let (:no_mailing_hash) do
  #     {
  #       status: "pending",
  #       cc_name: "John",
  #       email_address: "jcarl@gmail.com",
  #       mailing_address: nil,
  #       cc_number: 5110538084994719,
  #       cc_exp: "06/18",
  #       cc_cvv: "674",
  #       zip: 19583
  #     }
  #   end
  #
  #   let (:no_cc_num_hash) do
  #     {
  #       status: "pending",
  #       cc_name: "John",
  #       email_address: "jcarl@gmail.com",
  #       mailing_address: "123 Fake Street",
  #       cc_number: nil,
  #       cc_exp: "06/18",
  #       cc_cvv: "674",
  #       zip: 19583
  #     }
  #   end
  #
  #   let (:no_cc_exp_hash) do
  #     {
  #       status: "pending",
  #       cc_name: "John",
  #       email_address: "jcarl@gmail.com",
  #       mailing_address: "123 Fake Street",
  #       cc_number: 5110538084994719,
  #       cc_exp: nil,
  #       cc_cvv: "674",
  #       zip: 19583
  #     }
  #   end
  #
  #   let (:no_cc_cvv_hash) do
  #     {
  #       status: "pending",
  #       cc_name: "John",
  #       email_address: "jcarl@gmail.com",
  #       mailing_address: "123 Fake Street",
  #       cc_number: 5110538084994719,
  #       cc_exp: "06/18",
  #       cc_cvv: nil,
  #       zip: 19583
  #     }
  #   end
    #
    # let (:no_zip_hash) do
    #   {
    #     status: "pending",
    #     cc_name: "John",
    #     email_address: "jcarl@gmail.com",
    #     mailing_address: "123 Fake Street",
    #     cc_number: 5110538084994719,
    #     cc_exp: "06/18",
    #     cc_cvv: "123",
    #     zip: nil
    #   }
    # end

    it "must have a status" do
      expect(Order.new(no_status_hash)).to_not be_valid
      expect(Order.new(good_hash)).to be_valid
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

  # describe "pending_order" do

  #   it ""
  # end

  #describe "session_over" do
  #it ""
  #end

  #test that destroying an order destroys its order items

end
