Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'users', to: 'home#users'
  get 'search', to: 'news#search'
  get 'profile/:nickname', to: "home#profile"
  resources :news
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
