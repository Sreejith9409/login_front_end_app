Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#new"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'index', to: 'sessions#index'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :users
  post 'user/create', to: 'users#create'
end
