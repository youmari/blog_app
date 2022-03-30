Rails.application.routes.draw do
  resources :comments
  resources :likes
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
end
