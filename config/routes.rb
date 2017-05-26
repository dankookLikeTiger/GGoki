Rails.application.routes.draw do
  devise_for :users
  
  #create
  get '/posts/new' => 'posts#new'
  post '/posts/create' => 'posts#create'
  
  #Read
   root 'posts#index'
   get '/posts/show/:post_id' => 'posts#show'
  
  #update
  get '/posts/edit/:post_id' => 'posts#edit'
  post '/posts/update/:post_id' => 'posts#update'
  
  #Delete
  post '/posts/destroy/:post_id' => 'posts#destroy'
end
