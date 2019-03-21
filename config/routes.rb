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

    resources :admins, only: [:index]

    root 'static_pages#home'

    devise_for :users
    resources :articles do
      resources :images, only: [:create]
    end
    resources :categories
    resources :subscriptions
    resources :typeforms, only: [:show, :index]
    resources :static_pages, path: "", only: [:home, :contact] do
      get 'home', :on => :collection
      get 'contact', :on => :collection
    end

    get '*all', to: 'application#index', constraints: lambda { |req|
        req.path.exclude? 'rails/active_storage'
      }

end
