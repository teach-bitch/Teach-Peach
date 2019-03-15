Rails.application.routes.draw do
  namespace :admin do
    root "articles#index"
    resources :categories
    resources :articles, only: [:destroy, :index, :create, :show, :edit, :update, :new]
    resources :users
    resources :typeforms
  end
  root 'articles#index'
  resources :categories
  resources :articles
  devise_for :users
  resources :subscriptions
  resources :typeforms, only: [:show, :index]
end
