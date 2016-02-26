Rails.application.routes.draw do
  get  '/ping',  to: 'ping#index'

  post '/buildings',                  to: 'buildings#create'
  post '/floors/:floor_id/requests',  to: 'floors/requests#create'
  put  '/elevators/:id',              to: 'elevators#update'

end
