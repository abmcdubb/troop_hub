Rails.application.routes.draw do

get 'badges' => 'badges#index'
  devise_for :users, controllers: { :registrations => "users/registrations", :invitations => 'users/invitations' }

  root 'troops#home'

  get 'newsletters/new' => 'newsletters#new'
  post 'newsletters' => 'newsletters#create'
  get 'newsletters/:id' => 'newsletters#show'

resources :user_badges do
  get :autocomplete_badge_name, :on => :collection
end
resources :events, :only => [:new, :create] do
  get :autocomplete_badge_name, :on => :collection
end



#-------Troop-Specific Routes----------
# get 'user_badges/new' => 'user_badges#new'
# get 'user_badges' => 'user_badges#index'
  #get '/troops' => 'troops#index'
  get 'troops/new' => 'troops#new'
  post '/troops' => 'troops#create'
  get 'troops/search/name' => 'troops#name_search'
  get 'troops/search/location' => 'troops#location_search'
  get 'troops/:id' => 'troops#show', :as => :troop_show

  get '/troops/:troop_id/members' => 'troop_users#index', :as => :troop_user

  # get '/troops' => 'troops#index'
  # get 'troops/new' => 'troops#new'
  # post '/troops' => 'troops#create'

  # get '/troops/:troop_id/users/new' => 'users/invitations#new'
  # post '/troops/:troop_id/users' => 'users#create'
  # get '/troops/:troop_id/users/:id' => 'users#show', 

  #get 'troops/edit/:id' => 'troops#edit'
  #patch 'troops/update/:id' => 'troops#update'

#---Routes for Individual Users -----
  get '/users/:id' => 'users#show', :as => :user_show
  get '/users/edit/:id' => 'users#edit', :as => :edit_user
  patch '/users/update/:id' => 'users#update', :as => :update_user
  delete '/users/destroy' => 'troop_users#destroy'



#-------Events---------------
  get 'events' => 'events#index', :as => :events_index
  get 'events/new'
  get 'events/advanced_search' => 'events#advanced_search'
  get 'events/search' => 'events#search_results'
  get 'events/a_search' => 'events#advanced_search_results'
   get 'events/:id' => 'events#show', :as => :event
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id' => 'events#update'
  post 'events' => 'events#create'
  delete 'events/:id/delete' => 'events#delete'


  get 'troop_events/new' => 'troop_events#new'
  get 'troop_events/:troop_id/new_event' => 'troop_events#new_event', as: 'new_troop_event'
  post 'troop_events/new_event' => 'troop_events#create_event'
  post 'troop_events' => 'troop_events#create'
  get 'troop_events/:id' => 'troop_events#show', as: 'troop_event'

  post 'photos/:photoable_id/:photoable_type' => 'photos#create'
  delete 'photos/:photoable_id/:page_for_redirect/:photo_id' => 'photos#delete'

  get 'troops/:troop_id/photos' => 'photos#individual_troop', as: 'troop_photos'

  # get '/agenda' => 'agenda#index', :as => :troop_agenda
  # get '/agenda/new' => 'agenda#new', :as => :new_troop_agenda
  # post '/agenda' => 'agenda#create'
  # get '/agenda/:id' => 'agenda#show', :as => :agenda_show
  # get '/agenda/edit/:id' => 'agenda#edit'
  # patch '/agenda/update/:id' => 'agenda#update'
  # delete '/agenda/destroy' => 'agenda#destroy'

  get 'agenda/new' => 'agenda#new'
  post 'agendas' => 'agenda#create'
  get 'agenda/:id' => 'agenda#show', as: 'agenda_show'
  get 'agenda' => 'agenda#index'

    
  get 'skills' => 'skills#index'
  get 'skills/:id/index' => 'skills#category_index'
  get 'skills/:id'  => 'skills#show'

  #-------Troop Blog---------------
  get '/troops/:id/troop_blog/new' => 'troop_blogs#new',  :as => 'troop_blog_new'
  post '/troops/:id/troop_blogs' => 'troop_blogs#create', :as => 'troop_blogs'
  get 'troops/:id/troop_blog' => 'troop_blogs#index', :as => 'troop_blog_index'


end
