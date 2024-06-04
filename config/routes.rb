Rails.application.routes.draw do
  resources :sharks do
    resources :posts
  end
  root "sharks#index"
end
