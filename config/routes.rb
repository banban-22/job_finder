Rails.application.routes.draw do
  resources :articles
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/search', to: 'search#search'
  get '/home', to: 'home#index'
  root "home#index"

  # patch '/jobs/:id/edit', to: 'jobs#update', as: 'job_update'

  resources :jobs do
    resources :apply, only: [:create, :destroy]
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

  resources :apply, only: [:index]

  resources :jobs do
    resources :applications, only: [:new, :create]
  end

  resources :applications, only[:index]

end
