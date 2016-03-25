Rails.application.routes.draw do
  resources :artists, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :songs, only: [:index, :new, :create]
  end

  resources :songs, only: [:show]
  resources :playlists, only: [:index, :new, :create, :show]
end
