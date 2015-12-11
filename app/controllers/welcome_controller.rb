class WelcomeController < ApplicationController
    before_action :navbar_categories, only: [:index]
    
  def index
    x = rand(1..User.all.length)
    y = rand(1..User.all.length)
    @top_users = [User.find(x), User.find(y)]
    m = rand(1..Category.all.length)
    n = rand(1..Category.all.length)
    @top_categories = [Category.find(m), Category.find(n)]
  end
end
