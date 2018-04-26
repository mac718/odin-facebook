Rails.application.routes.draw do
  root "users#home"
  devise_for :users, :path => 'accounts'
  resources :users do 
    resources :profiles
    resources :posts
    patch '/update_avatar', to: 'profiles#update_avatar'
    get '/home', to: 'users#home'
  end
end
