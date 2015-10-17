Delorean::Application.routes.draw do

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
