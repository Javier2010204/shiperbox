Rails.application.routes.draw do
  resources :categories
  resources :quotes, only: [:create, :new, :show]
  resources :products
  resources :profiles, only:[:update, :show, :new, :create]
  get 'home/calculate'
  get 'home/index'
  get 'home/search', as: :search
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "home#index"
  end

  unauthenticated :user do
    root to: "home#unregistered", as: :unregistered
  end
end
