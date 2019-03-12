Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :charges
  devise_for :users
end
