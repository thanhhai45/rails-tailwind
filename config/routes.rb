Rails.application.routes.draw do
  root 'bills#index'
  resources :bills do
    resources :list_items
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
