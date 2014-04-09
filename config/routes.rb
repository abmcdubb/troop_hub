Rails.application.routes.draw do
  get '/troops' => 'troops#index'
  get 'troops/new' => 'troops#new'
  post '/troops' => 'troops#create'
  get 'troops/edit/:id' => 'troops#edit'
  get 'troops/:id' => 'troops#show'
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
