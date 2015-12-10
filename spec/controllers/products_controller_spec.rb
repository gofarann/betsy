require 'rails_helper'
require 'support/app_controller'


RSpec.describe ProductsController, type: :controller do
  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
    {
      product: {
        name: "necklace",
        price: 10,
        user_id: 2,
        stock: 3,
      }
    }
    end

    let (:bad_params) do
      {
        product: {
          name: "",
          price: 10,
          user_id: 2,
          stock: 3,
        }
      }
    end

    it "redirects to products#show page" do
      post :create, good_params
      expect(subject).to redirect_to product_path(Product.all.last)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end
  it_behaves_like "a quartzy controller"
end
