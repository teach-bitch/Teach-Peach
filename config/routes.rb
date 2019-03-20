Rails.application.routes.draw do

    namespace :shop do
      root "products#index"
      resources :facturations
      resources :line_items
      resources :baskets
        resources :charges
      resources :products
    end

    namespace :admins do
      root "articles#index"
      resources :categories
      resources :articles, only: [:destroy, :index, :create, :show, :edit, :update, :new]
      resources :users
      resources :typeforms
      namespace :shop do
        root "products#index"
        resources :facturations
        resources :join_product_categories
        resources :product_categories
        resources :products
      end
    end

    root 'static_pages#home'
    resources :categories
    resources :articles do
      resources :images, only: [:create]
    end
    devise_for :users
    resources :subscriptions
    resources :typeforms, only: [:show, :index]
    resources :static_pages, only: [:home] do
      get 'home', :on => :collection
    end

    get '*all', to: 'application#index', constraints: lambda { |req|
        req.path.exclude? 'rails/active_storage'
      }

end
