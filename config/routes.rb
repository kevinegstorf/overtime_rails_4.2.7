Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :posts
resources :admin_users

    root to: "users#index"
  end

  resources :posts
  devise_for :users, skip: [:registration]
  root to: 'static#homepage'

  namespace :api do
    namespace :v1 do
      resources :posts, only: :index
    end
  end
end
