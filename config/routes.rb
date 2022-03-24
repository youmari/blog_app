Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :posts
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
