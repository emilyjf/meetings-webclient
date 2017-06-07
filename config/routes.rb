Rails.application.routes.draw do
  get '/' => 'meetings#index'
  post '/meetings' => 'meetings#create'
  get '/meetings' => 'meetings#index'
  get '/meetings' => 'meetings#new'
  get '/meetings/:id' => 'meetings#show'

  patch '/meetings/:id' => 'meetings#update'
  delete '/meetings/:id' => 'meetings#destroy'
end
