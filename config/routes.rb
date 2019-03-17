Rails.application.routes.draw do

  get 'comments/new'
  get 'topics/new'
  get 'sessions/new'

  root 'homes#top'
  
  get 'homes/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :topics

  #いいね機能
  get 'likes/index'
  # お気に入りの追加
  post '/likes', to: 'likes#create'
  # お気に入りの削除
  delete "/likes", to: "likes#destroy"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #コメントの送信
  post "topics/comments", to: "comments#create"
  #コメントの削除
  delete "/comments", to:"comments#destroy"



end
