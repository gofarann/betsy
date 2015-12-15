class WelcomeController < ApplicationController
    before_action :navbar_categories, only: [:index]
    
  def index
    x = rand(1..User.all.length)
    y = rand(1..User.all.length)
    until y != x 
      y = rand(1..User.all.length)
    end
    @top_users = [User.find(x), User.find(y)]
    m = rand(1..Category.all.length)
    n = rand(1..Category.all.length)
    until n != m
      n = rand(1..Category.all.length)
    end
    @top_categories = [Category.find(m), Category.find(n)]
  end
end
