Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  get '/products/:id', to: 'products#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
