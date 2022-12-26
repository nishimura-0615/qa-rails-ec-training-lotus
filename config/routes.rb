Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :products
  resources :orders
  # Defines the root path route ("/")
  # root "articles#index"
end
