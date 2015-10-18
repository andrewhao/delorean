Delorean::Application.routes.draw do

  resources :inflation_adjustments
  resources :order_menu_items
  resources :menu_items
  resources :menus
  resources :restaurants
  resources :invoices
  resources :vehicle_types
  resources :trip_pool_trips
  resources :trip_pools
  resources :service_tiers
  resources :vehicles
  resources :orders
  resources :payments
  resources :trip_pools
  resources :trips
  resources :users
  root to: 'pages#root'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

end
