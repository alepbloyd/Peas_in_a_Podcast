Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/podcasts', to: 'podcasts#index'
  get '/podcasts/new', to: 'podcasts#new'
  post '/podcasts', to: 'podcasts#create'
  get '/podcasts/:id', to: 'podcasts#show'

  get '/podcasts/:id/episodes/new', to: 'episodes#new'
  post '/episodes', to: 'episodes#create'

  get '/podcasts/:id/edit', to: 'podcasts#edit'
  patch '/podcasts/:id/', to: 'podcasts#update'
  
  get '/episodes', to: 'episodes#index'
  get '/episodes/:id', to: 'episodes#show'
  get '/episodes/:id/edit', to: 'episodes#edit'
  patch '/episodes/:id', to: 'episodes#update'

  get '/podcasts/:id/episodes', to: 'podcasts#episodes'

  get '/podcasts/:id/delete', to: 'podcasts#delete'

  get 'episodes/:id/delete', to: 'episodes#delete'
end
