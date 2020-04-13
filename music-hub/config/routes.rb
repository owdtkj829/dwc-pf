Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#tops'
  get '/about' => 'home#about'

  #artistお気に入り登録・解除
  post '/artists/:artist_id/favorites' => "favorites#create"
  delete '/artists/:artist_id/favorites' => "favorites#destroy"
  #recommendお気に入り登録・解除
  post '/artists/:artist_id/recommends/:recommend_id/myrecommends' => "myrecommends#create"
  delete '/artists/:artist_id/recommends/:recommend_id/myrecommends' => "myrecommends#destroy"
  #マイカレンダーJquery用ルーティング
  get '/users/js/jquery.min.js' => "users#show"
  get '/users/js/script.js' => "users#show"

  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :artists do
    resources :recommends,only: [:index, :show, :create, :dastroy] do
      resources :comments,only: [:create, :destroy]
    end
  end
  resources :schedules, only: [:index, :show, :create, :update, :destroy]
end
