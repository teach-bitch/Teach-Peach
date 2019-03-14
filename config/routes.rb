Rails.application.routes.draw do
  namespace :admin do
    root "articles#index"
    resources :categories
    resources :articles, only: [:destroy, :index, :create, :show, :edit, :update, :new]
    resources :users
  end
  root 'articles#index'
  resources :categories
  resources :articles
  devise_for :users
    resources :subscriptions
end
