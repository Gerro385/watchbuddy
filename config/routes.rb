Rails.application.routes.draw do
  get 'media/show'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'profile/watchlist', to: 'pages#watchlist'
  get 'profile/favourites', to: 'pages#favourites'
  get 'profile/buddies', to: 'pages#buddies'
  get 'profile/seen', to: 'pages#seen'
  get '/.well-known/acme-challenge/UDNLFx9QL-MXNFNDcnlb4g0oL6NSIj5TAmyHEH5KgoA', to: 'pages#tslcert'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :media, only: %i[index show create]
  resources :users, only: %i[index show] do
    resources :watches, only: %i[index create update destroy]
    get '/watchlist', to: 'users#watchlist'
    get '/seen', to: 'users#seen'
    get '/favourites', to: 'users#favourites'
    get '/buddies', to: 'users#buddies'
    resources :requests, only: %i[create update destroy]
  end
  get '/like/:medium_id', to: 'watches#favourite', as: 'like'
  get '/watchlist/:medium_id', to: 'watches#watchlist', as: 'watchlist'
  get '/seen/:medium_id', to: 'watches#seen', as: 'seen'
  get '/rate/:medium_id', to: 'watches#rate', as: 'rate'
end
