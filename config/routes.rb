Rails.application.routes.draw do
  root "user#show"
  devise_for :users, :path => 'accounts'
  resources :users do 
    resources :profiles
    patch '/update_avatar', to: 'profiles#update_avatar'
  end
end
