Rails.application.routes.draw do
  devise_for :users
  root 'albums#index'
  resources :users, only: [:index, :show, :destroy]
  resources :albums
  resources :reviews, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
