require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
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

  let(:order) do
    Order.create!(order_hash)
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

  # checkout
  # confirm
  # cancel_as_user
  # cancel_as_guest
  # finalize
  # ship
  # pay
  # edit
  # update
  # destroy

  it_behaves_like "a quartzy controller"
end
