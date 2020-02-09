Rails.application.routes.draw do
  get 'search', to: 'search#search'
  get 'home/top'
  get 'home/about'
  # get '/movies/movie_data', to: 'movies#movie_data' ajax送信先のルーティング
  root 'movies#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :edit, :update]
  resources :movies, only: [:index, :show]
  resources :reviews do
    resource :good, only: [:create, :destroy] # /reviews/:review_id/good ①review_idをURLに持たせることでgoodのsave時などでreview_idを取得しやすいのでネストにしている。②goodにshowページ不要なのでresource。
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
