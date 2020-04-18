Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#tops'
  get '/about' => 'homes#about'
  get 'events', to: 'events#events', as: 'user_calendar'
  get 'events_artist', to: 'events#event', as: 'artist_calendar'

  #artistお気に入り登録・解除
  post '/artists/:artist_id/favorites' => "favorites#create"
  delete '/artists/:artist_id/favorites' => "favorites#destroy"
  get '/users/:id/favorites' => "users#favorite",as: 'favorites'

  #recommendお気に入り登録・解除
  post '/artists/:artist_id/recommends/:recommend_id/myrecommends' => "myrecommends#create"
  delete '/artists/:artist_id/recommends/:recommend_id/myrecommends' => "myrecommends#destroy"
  get '/users/:id/myrecommends' => "users#myrecommend",as: 'myrecommends'

  #userのevent一覧表示と詳細表示
  get '/users/:user_id/events' => "events#user_index",as: 'user_events'
  get '/users/:user_id/events/:id' => "events#user_show",as: 'user_event'

  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]

  resources :artists do
    get :search, on: :collection
    resources :events,only: [:index, :create, :destroy, :update]
    resources :recommends,only: [:index, :show, :create, :dastroy] do
      resources :comments,only: [:create, :destroy]
    end
  end

  resources :events, only: [:create]
  resources :relationships, only: [:create, :destroy]
end
