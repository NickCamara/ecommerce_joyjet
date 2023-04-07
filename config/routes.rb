Rails.application.routes.draw do
  resources :carts

  resources :articles

  resources :items

  resources :delivery_fees

  resources :eligible_transaction_volumes
end
