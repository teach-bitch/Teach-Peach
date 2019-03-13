Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :articles
    resources :users 
  end
  root 'articles#index'
  resources :categories
  resources :articles
  devise_for :users
    resources :subscriptions
end
