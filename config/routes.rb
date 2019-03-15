Rails.application.routes.draw do

  namespace :admin do
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
<<<<<<< HEAD
  resources :static_pages, only: [:home] do
=======
  resources :static_pages do
>>>>>>> change links on Teach Peach
    get 'home', :on => :collection
  end
end