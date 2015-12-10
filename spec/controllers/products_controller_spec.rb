require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

end
