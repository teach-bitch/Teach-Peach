Rails.application.routes.draw do
  root 'articles#index'
  resources :categories
  resources :articles
  devise_for :users
    resources :subscriptions
end
