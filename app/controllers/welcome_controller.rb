class WelcomeController < ApplicationController
    before_action :navbar_categories, only: [:index]
    
  def index
  end
end
