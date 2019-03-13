Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :charges
  resource :subscription
  devise_for :users
end
