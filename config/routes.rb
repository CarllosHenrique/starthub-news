Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'home#index'

  get 'users', to: 'home#users'
  get 'search', to: 'news#search'
  resources :news

  get '/profile/:nickname', to: 'profile#index', as: 'profile_index'

  get '/profile/:nickname/edit', to: 'profile#edit', as: 'profile_edit'
  patch '/profile/:nickname/edit', to: 'profile#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
