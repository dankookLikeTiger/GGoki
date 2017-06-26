Rails.application.routes.draw do
  devise_for :users
  
  #Posts
  
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
  ###################################################
  
  
  #Comments
  
  ## Create
  post '/posts/show/:post_id/comments/create' => 'comments#create' 
  
  ## Destroy
  post '/posts/show/:post_id/comments/destroy/:comment_id' => 'comments#destroy'
  
end
