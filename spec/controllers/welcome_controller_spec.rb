require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  describe 'GET index' do
    let(:user_hash) do {
      username: "Burp",
      email_address: "thing@thing.com",
      password: "this",
      password_confirmation: "this"
    }
    end
    let(:second_user_hash) do {
      username: "Ugh",
      email_address: "athing@thing.com",
      password: "this",
      password_confirmation: "this"
    }
    end
    it 'is successful' do
      user = User.create(user_hash)
      user1 = User.create(second_user_hash)
      cat = Category.create(name: "Cool Shit")
      cat2 = Category.create(name: "Better Shit")
      get :index
      expect(subject).to render_template :index
    end
  end

end
