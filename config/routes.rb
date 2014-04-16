Rails.application.routes.draw do


  devise_for :users, controllers: { :registrations => "users/registrations" }

  root 'troops#home'

  get 'newsletters/new' => 'newsletters#new'
  post 'newsletters' => 'newsletters#create'
  get 'newsletters/:id' => 'newsletters#show'
  get 'newsletters' => 'newsletters#index'
 
  get '/troops' => 'troops#index'
  get 'troops/new' => 'troops#new'
  post '/troops' => 'troops#create'
  get 'troops/edit/:id' => 'troops#edit'
  get 'troops/:id' => 'troops#show', :as => :troop_show
  patch 'troops/update/:id' => 'troops#update'
  delete 'troops/destroy' => 'troops#destroy'

  get '/troops/:troop_id/users' => 'users#index', :as => :troop_user
  get '/troops/:troop_id/users/new' => 'users#new', :as => :new_troop_user
  post '/troops/:troop_id/users' => 'users#create'
  get '/troops/:troop_id/users/:id' => 'users#show', :as => :user_show
  get '/troops/:troop_id/users/edit/:id' => 'users#edit'
  patch '/troops/:troop_id/users/update/:id' => 'users#update'
  delete '/troops/:troop_id/users/destroy' => 'users#destroy'

  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'
  get 'events/new'
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id/update' => 'events#update'
  post 'events' => 'events#create'
  delete 'events/:id/delete' => 'events#delete'
  get 'events/search' => 'events#search_results'
  get 'events/advanced_search' => 'events#advanced_search'

  get '/troops' => 'troops#index'
  get 'troops/new' => 'troops#new'
  post '/troops' => 'troops#create'
  get 'troops/edit/:id' => 'troops#edit'
  get 'troops/:id' => 'troops#show', as: 'troop'
  patch 'troops/update/:id' => 'troops#update'
  delete 'troops/destroy' => 'troops#destroy'

  get 'troop_events/new' => 'troop_events#new'
  get 'troop_events/:troop_id/new_event' => 'troop_events#new_event', as: 'new_event'
  post 'troop_events/new_event' => 'troop_events#create_event'
  post 'troop_events' => 'troop_events#create'
  get 'troop_events/:id' => 'troop_events#show', as: 'troop_event'

  post 'photos/:photoable_id/:photoable_type' => 'photos#create'
  delete 'photos/:photoable_id/:page_for_redirect/:photo_id' => 'photos#delete'

  get 'troops/:troop_id/photos' => 'photos#individual_troop', as: 'troop_photos'

  get '/agenda' => 'agenda#index', :as => :troop_agenda
  get '/agenda/new' => 'agenda#new', :as => :new_troop_agenda
  post '/agenda' => 'agenda#create'
  get '/agenda/:id' => 'agenda#show', :as => :agenda_show
  get '/agenda/edit/:id' => 'agenda#edit'
  patch '/agenda/update/:id' => 'agenda#update'
  delete '/agenda/destroy' => 'agenda#destroy'

    
  get 'skills' => 'skills#index'
  get 'skills/:id'  => 'skills#show'

end
