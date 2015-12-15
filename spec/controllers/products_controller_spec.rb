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
    let(:user) do
      User.create(username: "Mister",
                  email_address: "stud@manly.com",
                  password: "pw",
                  password_confirmation: "pw")
    end

    let(:good_params) do
      {
        product:{
          name: "necklace",
          price: 10,
          user_id: 2,
          stock: 3
        },
        categories: []
      }
    end

    let(:bad_params) do
      {
        product:{
          name: nil,
          price: nil
        },
        categories: []
      }
    end

    before :each do
      session[:user_id] = user.id
    end

    it "redirects to products index page when good params are passed" do
      post :create, good_params.merge(id: 1)
      # Success case to index page
      expect(subject).to redirect_to user_path(user.id)
      # Error case to
    end

    it "renders the edit template when bad params are passed" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let(:product) do
      Product.create(name: "necklace", price: 10, user_id: 2, stock: 3)
    end

    it "renders edit view" do
      get :edit, id: product.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    let(:show_product) do
      Product.create(name: "necklace", price: 10, user_id: 2, stock: 3)
    end

    it "renders the show view" do
      get :show, id: show_product.id
      expect(subject).to render_template :show
    end
  end

  describe "PATCH 'update'" do
    let(:product) do
      Product.create(name: "necklace", price: 10, user_id: 2, stock: 3)
    end

    let(:good_product) do
      {
        id: product.id,
        product: {
          name: "necklace",
          price: 10,
          user_id: 2,
          stock: 3,
        }
      }
    end

    let(:bad_product) do
    {
      id: product.id,
      product: {
        name: "",
        price: 10,
        user_id: 2,
        stock: 3,
      }
    }
    end

    it "redirects to product show page" do
      patch :update, good_product
      expect(subject).to redirect_to product_path(product.id)
    end

    it "renders edit view" do
      patch :update, bad_product
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'review'" do
    let(:product) do
      Product.create(name: "necklace", price: 10, user_id: 2, stock: 3)
    end
    let(:review_params) do
    {
      id: product.id,
      review: {
        rating: 4,
        body: "so pretty!"
      }
    }
    end

    it "creates a new product review" do
      post :review, review_params.merge(product_id: product.id)
      last = Review.last
      expect(last.rating).to eq 4
    end
  end


  describe "DELETE 'destroy'" do
    before :each do
        request.env["HTTP_REFERER"] = "back"
    end
    let(:product) do
      Product.create(name: "necklace", price: 10, user_id: 2, stock: 3)
    end

    it "redirects to products index page" do
      delete :destroy, id: product.id
      expect(subject).to redirect_to "back"
    end
  end

  it_behaves_like "a quartzy controller"
end
