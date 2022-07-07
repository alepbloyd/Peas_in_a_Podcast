Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/podcasts', to: 'podcasts#index'
  get '/podcasts/:id', to: 'podcasts#show'

  get '/episodes', to: 'episodes#index'
end
