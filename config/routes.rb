Rails.application.routes.draw do

  root to: "home#index"

  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show, :index]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
