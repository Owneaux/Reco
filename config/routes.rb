Rails.application.routes.draw do

  devise_for :promoters
  devise_for :businesses, controllers: { :registrations =>'businesses/registrations' }

  root to: 'welcome#index'

  get 'welcome/index' => 'welcome#index'
  get 'welcome/sign_process' => 'welcome#sign_process'

  get 'settings/index'

  get 'home/index' => 'home#index'

  get 'business_promoters/index' => "business_promoters#index"
  get 'business_promoters/new' => "business_promoters#new"
  get 'business_promoters/create' => "business_promoters#create"
  get 'business_promoters/city_list' => "business_promoters#city_list"

#   get 'users/promoter' => "users#promoter"

  resources :deals

  resources :deal_types

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
