Rails.application.routes.draw do
  root "users#home"
  devise_for :users, :path => 'accounts'
  resources :users do 
    resources :profiles
    resources :posts do 
      resources :likes, only: [:create, :destroy], :defaults => { :likeable => 'Post' }
      resources :comments, :defaults => { :commentable => 'Post' } do 
        resources :likes, only: [:create, :destroy], :defaults => { :likeable => 'Comment' }
      end
    end
    patch '/update_avatar', to: 'profiles#update_avatar'
    get '/home', to: 'users#home'
  end
  resources :friend_requests, only: [:create, :destroy, :index, :update]
end
