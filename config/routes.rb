Rails.application.routes.draw do
  
  # devise_for :scouts
  devise_for :adults, controllers: { :registrations => "adult/registrations", :sessions => "adult/sessions"  }
  devise_for :scouts, controllers: { registrations: "scout/registrations" }  

  # devise_scope :adults do
  #   get "/adults/sign_in_pop_up" => "adult/sessions#popup_form", :as => :new_adult_session_pop_up_form
  # end

  # devise_scope :adult do
  #   get "adult/sessions/sign_in_pop_up", to: "adult/sessions#popup"
  # end

  get 'newsletters/new' => 'newsletters#new'

  
  
  get 'newsletters/new' => 'newsletters#new'

  post 'newsletters' => 'newsletters#create'
  get 'newsletters/:id' => 'newsletters#show'
  get 'newsletters' => 'newsletters#index'

  root 'troops#home'

  get '/troops' => 'troops#index'
  get 'troops/new' => 'troops#new'
  post '/troops' => 'troops#create'
  get 'troops/edit/:id' => 'troops#edit'
  get 'troops/:id' => 'troops#show', :as => :troop_show
  patch 'troops/update/:id' => 'troops#update'
  delete 'troops/destroy' => 'troops#destroy'

  # resources :troops do
  #   resources :agendas, :only => [:new, :create, :show, :update]
  # end

  # get '/troops/:troop_id/agenda'

  # get '/troops/:troop_id/agenda/new'

  # get '/troops/:troop_id/agenda'

  # get '/troops/:troop_id/agenda/:id'

  # get '/troops/:troop_id/agenda/edit'

  # get '/troops/:troop_id/agenda/update'

  # get '/troops/:troop_id/agenda/destroy'


  get '/troops/:troop_id/scouts' => 'scouts#index', :as => :troop_scouts
  get '/troops/:troop_id/scouts/new' => 'scouts#new', :as => :new_troop_scout
  post '/troops/:troop_id/scouts' => 'scouts#create'
  get '/troops/:troop_id/scouts/:id' => 'scouts#show', :as => :scout_show
  get '/troops/:troop_id/scouts/edit/:id' => 'scouts#edit'
  patch '/troops/:troop_id/scouts/update/:id' => 'scouts#update'
  delete '/troops/:troop_id/scouts/destroy' => 'scouts#destroy'

  get 'events/index' => 'events#index'
  get 'events/new'
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id/update' => 'events#update', :as => 'event'
  post 'events' => 'events#create', :as => 'events'
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

  get '/troops/:troop_id/adults/new' => 'adults#new', as: 'adult_new'
  get '/troops/:troop_id/adults' => 'adults#index', as: 'adults'
  post '/troops/:troop_id/adults' => 'adults#create'
  get '/troops/:troop_id/adults/:id' => 'adults#show', as: 'adult_show'
  get '/troops/:troop_id/adults/edit/:id' => 'adults#edit'
  get '/troops/:troop_id/adults/:id' => 'adults#show'
  patch '/troops/:troop_id/adults/update/:id' => 'adults#update'
  delete '/troops/:troop_id/adults/destroy' => 'adults#destroy'
  get '/popup' => 'adults#popup'

  get '/troops/:troop_id/adults/:adult_id/skills/new' => 'skills#new', as: 'skills_new'
  post '/troops/:troop_id/adults/:adult_id/skills' => 'skills#create'
  # get '/troops/:troop_id/adults' => 'adults#index', as: 'adults'
  get '/troops/:troop_id/adults/:adult_id/skills' => 'skills#index', as: 'skills'

#  get 'troop_events' => 'troop_events#index'
  get 'troop_events/new' => 'troop_events#new'
  get 'troop_events/:troop_id/new_event' => 'troop_events#new_event', as: 'new_event'
  post 'troop_events/new_event' => 'troop_events#create_event'
  post 'troop_events' => 'troop_events#create'
  get 'troop_events/:id' => 'troop_events#show', as: 'troop_event'

  post 'photos/:photoable_id/:photoable_type' => 'photos#create'
  delete 'photos/:photoable_id/:page_for_redirect/:photo_id' => 'photos#delete'

  get 'troops/:troop_id/photos' => 'photos#individual_troop', as: 'troop_photos'

end
