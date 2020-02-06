Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  root 'movies#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :edit, :update]
  resources :movies, only: [:index, :show]
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
