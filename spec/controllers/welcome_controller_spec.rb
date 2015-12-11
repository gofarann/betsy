require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  describe 'GET index' do
    it 'is successful' do
      get :index
      expect(subject).to render_template :index
    end
  end

end
