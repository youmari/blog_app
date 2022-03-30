Rails.application.routes.draw do
  resources :likes
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments 
    end
  end
end
