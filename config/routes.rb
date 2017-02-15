Rails.application.routes.draw do


 resources :comments do
   post 'votes/up'

     post 'votes/down'
 end

 get '/login', to:'sessions#new'

 post '/login', to:'sessions#create'

 delete '/logout', to: 'sessions#destroy'



 get 'sessions/new'

 get 'sessions/create'

 get 'sessions/destroy'

 resources :posts do
     post 'votes/up'

     post 'votes/down'
 end
 resources :users

end