Rails.application.routes.draw do

  get 'business/show'

  devise_for :promoters
  devise_for :businesses, controllers: { :registrations =>'businesses/registrations' }

  root to: 'welcome#index'

  get 'welcome/index' => 'welcome#index'
  get 'welcome/sign_process' => 'welcome#sign_process'

  # Untoggle when settings were added again
  # get 'settings/index'

  get 'home/index' => 'home#index'
  post 'home/checkout' => 'home#check_out_referrals'

  get 'business_promoters/payment/:id' => "business_promoters#payment"
  post 'business_promoters/checkout_payment' => "business_promoters#checkout_payment"
  get 'business_promoters/history/:id' => "business_promoters#history"
  get 'business_promoters/new' => "business_promoters#new"
  get 'business_promoters/create' => "business_promoters#create"
  delete 'business_promoters/:id' => "business_promoters#destroy"
  get 'business_promoters/create' => "business_promoters#create"
  get 'business_promoters/:id' => "business_promoters#show", as: :business_promoters
  get 'business_promoters/checkout/:id' => "business_promoters#checkout"

  resources :deals

  #resources :deal_types
  get 'deal_types/edit' => 'deal_types#edit'
  post 'deal_types/update' => 'deal_types#update'

end
