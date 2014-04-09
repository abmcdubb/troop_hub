Rails.application.routes.draw do
  get 'events/index' => 'events#index'

  get 'events/new'

  get 'events/edit'

  get 'events/show'

  post 'events' => 'events#create', :as => 'events'

  get '/troops' => 'troops#index'
  get 'troops/new' => 'troops#new'
  post '/troops' => 'troops#create'
  get 'troops/edit/:id' => 'troops#edit'
  get 'troops/:id' => 'troops#show'
  patch 'troops/update/:id' => 'troops#update'
  delete 'troops/destroy' => 'troops#destroy'

get "/users/:user_id/contacts/:id/sms" => 'contacts#sms', as: 'contact_sms'

  get '/troops/:troop_id/adults/new' => 'adults#new'
  get '/troops/:troop_id/adults' => 'adults#index'
  post '/troops/:troop_id/adults' => 'adults#create'
  get '/troops/:troop_id/adults/:id' => 'adults#show'
  get '/troops/:troop_id/adults/edit/:id' => 'adults#edit'
  get '/troops/:troop_id/adults/:id' => 'adults#show'
  patch '/troops/:troop_id/adults/update/:id' => 'adults#update'
  delete '/tropps/:troop_id/adults/destroy' => 'adults#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
