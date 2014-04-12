Rails.application.routes.draw do
  
  # devise_for :scouts
  devise_for :adults, controllers: { :registrations => "adult/registrations" }
  devise_for :scouts, controllers: { registrations: "scout/registrations" }

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

  get '/troops/:troop_id/adults/:adult_id/skills/new' => 'skills#new', as: 'skills_new'
  post '/troops/:troop_id/adults/:adult_id/skills' => 'skills#create'
  # get '/troops/:troop_id/adults' => 'adults#index', as: 'adults'
  get '/troops/:troop_id/adults/:adult_id/skills' => 'skills#index', as: 'skills'

#  get 'troop_events' => 'troop_events#index'
  get 'troop_events/new' => 'troop_events#new'
  post 'troop_events' => 'troop_events#create'
  get 'troop_events/:id' => 'troop_events#show', as: 'troop_event'

  post 'photos/:photoable_id/:photoable_type' => 'photos#create'
  delete 'photos/:photoable_id/:page_for_redirect/:photo_id' => 'photos#delete'

  get 'troops/:troop_id/photos' => 'photos#individual_troop', as: 'troop_photos'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
