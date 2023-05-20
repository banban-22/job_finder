Rails.application.routes.draw do
  resources :articles
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/search', to: 'search#search'
  get '/home', to: 'home#index'
  root "home#index"

  resources :jobs do
    resources :applies, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    get:liked, on: :collection
  end

  resources :jobs do
    resources :reviews
  end

  resource :sessions

  resources :users do
    member do
      get :change_password
      patch :update_password
    end
  end

  resources :applies, only: [:index]

end
