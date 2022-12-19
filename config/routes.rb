Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :products
  get    '/login',   to: 'sessions#new'
  # Defines the root path route ("/")
  # root "articles#index"
end
