Rails.application.routes.draw do
  get '/dishes/:dish_id', to: 'dishes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
