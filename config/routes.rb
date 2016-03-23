Rails.application.routes.draw do
  resources :artists, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show]
end
