Rails.application.routes.draw do

  get '/' => 'welcome#index', as: :root

  get '/sessions/new' => 'sessions#new', as: :login
  get '/users/new' => 'users#new', as: :signup

  get '/cart' => 'orders#cart', as: :cart

  get '/checkout'  => 'orders#checkout', as: :checkout

  get '/orders/confirm' => 'orders#confirm'

  get '/users/:id/dash' => 'users#dash', as: :user_dash

  get 'users/:id/order_dash' => 'users#order_dash', as: :user_order_dash

  get '/users/:id/products' => 'products#by_user', as: :user_products_dash

  resources :sessions
  resources :users
  resources :products
  resources :orders
  resources :reviews, only: [:new, :create]

end
