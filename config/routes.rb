Rails.application.routes.draw do
  resources :sharks
  root "sharks#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
