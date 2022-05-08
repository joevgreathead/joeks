Rails.application.routes.draw do
  resources :categories
  resources :jokes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "jokes#index"
end