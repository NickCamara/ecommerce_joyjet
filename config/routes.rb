Rails.application.routes.draw do
  resources :carts

  resources :articles

  resources :items
end
