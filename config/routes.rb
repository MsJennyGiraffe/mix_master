Rails.application.routes.draw do

  root to: "home#index"

  get '/auth/spotify/callback', to: 'sessions#create'

  delete '/logout', to: "sessions#destroy"

  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show, :index]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
