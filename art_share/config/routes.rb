Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, only: [:index, :show, :update, :create, :destroy]
  # resources :artworks
  resources :users, only: [:index, :show, :update, :create, :destroy] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:show, :update, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]
end
