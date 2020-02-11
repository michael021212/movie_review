Rails.application.routes.draw do
  get 'search', to: 'search#search'
  get 'home/top'
  get 'home/about'
  # get '/movies/movie_data', to: 'movies#movie_data' ajax送信先のルーティング
  root 'movies#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[create destroy] # /users/:user_id/relationships :relationships_idは不要なのでresource
    get :followings, on: :member # /users/:id/followings 自分がフォローしている人一覧の画面用のルーティング。memberをつけることで/:idが入る。collectionだと/:idは入らない
    get :followers, on: :member # /users/:id/followers 自分をフォローしている人一覧の画面用のルーティング。memberをつけることで/:idが入る。collectionだと/:idは入らない
  end
  resources :movies, only: %i[index show] do
    resource :interest, only: %i[create destroy] # /movies/:movie_id/interest ①movie_idをURLに持たせることでinterestのsave時などでmovie_idを取得しやすいのでネストにしている。②/:interest_idは不要(showページ不要)なのでresource。
  end
  resources :reviews do
    resource :good, only: %i[create destroy] # /reviews/:review_id/good ①review_idをURLに持たせることでgoodのsave時などでreview_idを取得しやすいのでネストにしている。②/:good_idは不要(showページ不要)なのでresource。
    resource :bad, only: %i[create destroy] # /reviews/:review_id/bad ①review_idをURLに持たせることでbadのsave時などでreview_idを取得しやすいのでネストにしている。②/:bad_idは不要(showページ不要)なのでresource。
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
