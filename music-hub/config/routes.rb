Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#tops'
  get '/about' => 'home#about'

  #artistお気に入り登録・解除
  post '/artists/:artist_id/favorites' => "favorites#create"
  delete '/artists/:artist_id/favorites' => "favorites#destroy"

  resources :users, only: [:show, :create, :update, :destroy]
  resources :artists
  resources :schedules, only: [:index, :show, :create, :update, :destroy]

end
