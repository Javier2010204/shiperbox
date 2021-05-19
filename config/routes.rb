Rails.application.routes.draw do
  resources :buys
  resources :guides
  resources :pre_orders
  resources :products
  get 'home/calculate'
  get 'home/index'
  get 'home/search', as: :search
  get 'search/create'
  get 'search/index'
  get 'search/show'
  get 'search/quotes'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "home#index"
    resources :quotes
    resources :categories
    resources :profiles, only:[:update, :show, :new, :create, :edit, :index]
    resources :orders
  end

  unauthenticated :user do
    root to: "home#unregistered", as: :unregistered
    resources :quotes, only: [:create, :new, :show]
  end
end
