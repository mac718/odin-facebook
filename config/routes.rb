Rails.application.routes.draw do
  root "users#home"
  devise_for :users, :path => 'accounts', :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", 
  :registrations => "users/registrations" }
  resources :users, only: [:home, :index, :show, :edit, :update] do 
    resources :profiles
    resources :photos do
      resources :likes, only: [:create, :destroy], :defaults => { :likeable => 'Photo' }
    end
    resources :posts do 
      resources :likes, only: [:create, :destroy], :defaults => { :likeable => 'Post' }
      resources :comments, :defaults => { :commentable => 'Post' } do 
        resources :likes, only: [:create, :destroy], :defaults => { :likeable => 'Comment' }
      end
    end
    patch '/update_avatar', to: 'profiles#update_avatar'
    patch '/update_cover_photo', to: 'profiles#update_cover_photo'
    get '/home', to: 'users#home'
  end
  resources :friend_requests, only: [:create, :destroy, :index, :update]
  resources :friends, only: [:index, :destroy]
end
