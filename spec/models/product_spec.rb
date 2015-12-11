require 'rails_helper'


#
#   create_table "products", force: :cascade do |t|
#     t.string   "name"
#     t.integer  "price"
#     t.integer  "user_id"
#     t.integer  "stock"
#     t.string   "photo_url"
#     t.string   "description"
#     t.datetime "created_at",                  null: false
#     t.datetime "updated_at",                  null: false
#     t.boolean  "retired",     default: false
#   end

RSpec.describe Product, type: :model do
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

    let (:no_name_hash) do
      {
        status: "pending",
        cc_name: nil,
        email_address: "jcarl@gmail.com",
        mailing_address: "653 Gorge Way",
        cc_number: 5110538084994719,
        cc_exp: "06/18",
        cc_cvv: "674",
        zip: 19583
      }
    end

    let (:no_email_hash) do
      {
        status: "pending",
        cc_name: "John",
        email_address: nil,
        mailing_address: "653 Gorge Way",
        cc_number: 5110538084994719,
        cc_exp: "06/18",
        cc_cvv: "674",
        zip: 19583
      }
    end

    let (:no_mailing_hash) do
      {
        status: "pending",
        cc_name: "John",
        email_address: "jcarl@gmail.com",
        mailing_address: nil,
        cc_number: 5110538084994719,
        cc_exp: "06/18",
        cc_cvv: "674",
        zip: 19583
      }
    end

    let (:no_cc_num_hash) do
      {
        status: "pending",
        cc_name: "John",
        email_address: "jcarl@gmail.com",
        mailing_address: "123 Fake Street",
        cc_number: nil,
        cc_exp: "06/18",
        cc_cvv: "674",
        zip: 19583
      }
    end

    let (:no_cc_exp_hash) do
      {
        status: "pending",
        cc_name: "John",
        email_address: "jcarl@gmail.com",
        mailing_address: "123 Fake Street",
        cc_number: 5110538084994719,
        cc_exp: nil,
        cc_cvv: "674",
        zip: 19583
      }
    end

    let (:no_cc_cvv_hash) do
      {
        status: "pending",
        cc_name: "John",
        email_address: "jcarl@gmail.com",
        mailing_address: "123 Fake Street",
        cc_number: 5110538084994719,
        cc_exp: "06/18",
        cc_cvv: nil,
        zip: 19583
      }
    end

    let (:no_zip_hash) do
      {
        status: "pending",
        cc_name: "John",
        email_address: "jcarl@gmail.com",
        mailing_address: "123 Fake Street",
        cc_number: 5110538084994719,
        cc_exp: "06/18",
        cc_cvv: "123",
        zip: nil
      }
    end

    it "must have a name" do
      expect(Category.new(name: nil)).to_not be_valid
    end
#
    it "must have a unique name" do
      @test_category = Category.new(name: "Birthstone")
      @test_category.save
      expect(@test_category).to be_valid
      expect(Category.new(name: "Birthstone")).to_not be_valid
      @test_category.destroy
    end

    it "must have a price" do

    end

    it "must have a price that is a number" do

    end

    it "must have a price greater than zero" do

    end

    it "must belong to a User" do
    end
  end
end
