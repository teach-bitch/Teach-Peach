Rails.application.routes.draw do

  resources :facturations
  resources :line_items
  resources :baskets
  resources :join_product_categories
  resources :product_categories
  resources :products

  namespace :admins do
    root "articles#index"
    resources :categories
    resources :articles, only: [:destroy, :index, :create, :show, :edit, :update, :new]
    resources :users
    resources :typeforms
  end

  root 'static_pages#home'
  resources :categories
  resources :articles
  devise_for :users
  resources :subscriptions
  resources :typeforms, only: [:show, :index]
  resources :static_pages, only: [:home] do
    get 'home', :on => :collection
  end
  
end
