Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get "search", to: "posts#search"
  get "profile", to: "posts#profile"

  resources :users, only: [:update]
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
