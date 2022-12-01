Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  get 'users/:id/edit', to: 'users#edit'
  # Defines the root path route ("/")
  # root "articles#index"
end
