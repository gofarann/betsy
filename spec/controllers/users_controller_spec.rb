require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:good_hash) do {
    username: "Burp",
    email_address: "thing@thing.com",
    password: "this",
    password_confirmation: "this"
  }
  end

  let(:user) {User.create(good_hash)}

  describe 'GET dash' do
    it "shows the user dash page" do
      get :dash, id: user.id
      expect(subject).to render_template :dash
    end
  end

end
