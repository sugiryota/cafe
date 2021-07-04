Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index,:new,:create]

  get 'items/alway/:alway_id' => 'items#alway'
end
