Rails.application.routes.draw do
  devise_for :users
  root 'albums#index'
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end
  resources :albums do
    resources :reviews, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
