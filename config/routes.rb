Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index,:new,:create,:show] do
    collection do
      get :online
    end
  end
  resources :maps, only: [:index]

  get 'items/alway/:alway_id' => 'items#alway'
  get 'items/month/:category_id' => 'items#month'
end
