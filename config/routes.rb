Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index,:new,:create]
  resources :maps, only: [:index]

  get 'items/alway/:alway_id' => 'items#alway'
end
