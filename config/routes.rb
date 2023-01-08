Rails.application.routes.draw do
  root 'static_pages#home'
  get '/login', to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  get 'signup', to:'users#new'
  post 'signup', to:'users#create'
  resources :users
  resources :products
  resources :orders
end
