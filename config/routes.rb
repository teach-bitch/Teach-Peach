Rails.application.routes.draw do
  root 'articles#index'
  resources :categories
  resources :articles
  resources :charges
  devise_for :users
end
