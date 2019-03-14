Rails.application.routes.draw do
  constraints subdomain: "hooks" do
  post '/:integration_name' => 'webhooks#receive', as: :receive_webhooks
  end

  root 'articles#index'
  resources :categories
  resources :articles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
