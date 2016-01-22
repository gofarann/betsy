require 'rails_helper'
require 'support/app_controller'

RSpec.describe OrdersController, type: :controller do

  let(:order_hash) do
  {
    status: "pending",
    cc_name: "John Carlisle",
    email_address: "jcarl@gmail.com",
    mailing_address: "123 Holly Lane",
    cc_number: 5110538084994719,
    cc_exp: "06/18",
    cc_cvv: "674",
    zip: 98040,
    city: "Mercer Island",
    state: "WA"
  }
  end

  let(:order) do
    Order.create!(order_hash)
  end

  let(:cart_status) do
    @cart_status
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: order.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'cart'" do
    it "sets cart status to empty if there is no order_id in session" do
      get :cart, {}, {:order_id => nil}
      expect(@cart_status).to eq(nil)
      expect(@order).to eq(nil)
    end
    it "renders the cart view" do
      get :cart, {}, {:order_id => order.id }
      expect(subject).to render_template :cart
    end

  end

  describe "DELETE 'clear_cart'" do
    it "sets the session order_id to nil" do
      delete :clear_cart, {}, {:order_id => order.id }
      expect(session[:order_id]).to be_nil
    end
    it "redirects to the root path" do
      delete :clear_cart, {}, {:order_id => order.id }
      expect(subject).to redirect_to(root_path)
    end
  end

  describe "GET 'checkout'" do
    it "renders the checkout view" do
      get :checkout, {}, {:order_id => order.id }
      expect(subject).to render_template :checkout
    end
  end

  describe "GET 'confirm'" do
      let(:good_hash) do {
        username: "Burp",
        email_address: "thing@thing.com",
        password: "this",
        password_confirmation: "this",
        name: "Burp",
        street_address: "2146 Sherman Ave",
        city: "Evanston",
        state: "IL",
        zip: 60201
        }
      end

      let(:user) {User.create(good_hash)}

      let(:order_hash) do
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

      let(:sized_order) do
        Order.create!(order_hash)
      end

      let(:product_params) do
        {
          retired: false,
          name: "Test Product",
          price: 2040 ,
          user_id: "1",
          stock: "2" ,
          photo_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSdu1XTO5gfUbPLLseSkv2QgYSoofnZ6tx3Yt3BXo2OQUMakGMQ",
          description: "Let this delightful emerald sword help you thwack your way through the world." ,
          length: 20,
          width: 20,
          height: 20,
          weight: 100
        }
      end

      let(:product) do
        Product.create!(product_params)
      end

      let(:order_item_params) do
        {
          product_id: 1, order_id: 1, quantity: 10
        }
      end

      let(:order_item) do
        Orderitem.create!(order_item_params)
      end


    it "renders the confirm view" do
      get :confirm, {:id => order.id}, {:order_id => order.id }
      expect(subject).to render_template :confirm
    end

    it "returns the correct number of boxes" do
      user
      product
      order_item
      sized_order.orderitems << Orderitem.find(1)
      session[:order_id] = 1
      get :confirm, { :id => 1 }
      expect(assigns(:shipping_info).keys).to eq ["ups"]
    end

  end


  describe "PATCH 'cancel_as_guest'" do
    it "updates the order's status to cancelled" do
      expect(order.status).to eq("pending")
      patch :cancel_as_guest, {:id => order.id}, {:order_id => order.id }
      order.reload
      expect(order.status).to eq("cancelled")
    end
    it "sets order_id in session info to nil" do
      delete :cancel_as_guest, {:id => order.id}, {:order_id => order.id }
      expect(session[:order_id]).to be_nil
    end
    it "redirects to root path" do
      patch :cancel_as_guest, {:id => order.id}, {:order_id => order.id }
      expect(subject).to redirect_to(root_path)
    end
  end

  #need to add more!
  describe "PATCH 'finalize'" do
    it "sets the session order_id to nil" do
      patch :finalize, {:id => order.id}, {:order_id => order.id }
      expect(session[:order_id]).to be_nil
    end
    it "renders the finalize view" do
      patch :finalize, {:id => order.id}, {:order_id => order.id }
      expect(subject).to render_template :finalize
    end
  end



  # pay
  # edit
  # update
  # destroy

  it_behaves_like "a quartzy controller"
end
