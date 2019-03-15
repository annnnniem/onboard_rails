Rails.application.routes.draw do
  	root 'application#home'
  	get 'users/new'
  	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   	resources :users
   	get '/login', to: 'sessions#new'
   	post '/login', to: 'sessions#create'
   	post '/logout', to: 'sessions#destroy'
   	post '/auth/intercom/callback' => 'sessions#create_oauth'
end


