Rails.application.routes.draw do
  get '/ping',  to: 'ping#index'
  post '/buildings',  to: 'buildings#create'
end
