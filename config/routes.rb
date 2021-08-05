Rails.application.routes.draw do


  
  
devise_for :users

root to: "home#index"
resources :users
resources :plays
resources :posts
resources :openrecs
end
