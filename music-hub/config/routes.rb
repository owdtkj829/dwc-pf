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

  #userのfullcalendaer表示用
  get '/users/:user_id/events' => "events#user_index",as: 'user_events'

  #userのフォロー、フォロワーのviewページ
  get 'users/:id/follows' => 'users#following',as: 'follows'
  get 'users/:id/followers' => 'users#followers',as: 'followers'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :artists, only: [:index, :new, :edit, :create, :update, :destroy] do
    get :search, on: :collection
    #eventsのindexをartistのfullcalendar表示用として使用
    resources :events, only: [:index, :destroy, :update]
    resources :recommends,only: [:index, :show, :create, :destroy] do
      resources :comments,only: [:create, :destroy]
    end
  end

  resources :events, only: [:create]
  resources :relationships, only: [:create, :destroy]
end
