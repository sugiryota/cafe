Rails.application.routes.draw do
  get 'pays/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index,:new,:create,:show] do
    collection do
      get :online,:all_month
    end
    member do
      resources :pays,only: [:index,:create]
    end
  end
  resources :maps, only: [:index]
  

  get 'items/alway/:alway_id' => 'items#alway'
  get 'items/month/:category_id' => 'items#month'
end
