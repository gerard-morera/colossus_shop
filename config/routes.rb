Rails.application.routes.draw do
  namespace :admin do
    resources :products
    resources :categories
  end
  
  root 'store#index'
  resources :store, only: [:index, :show]
end
