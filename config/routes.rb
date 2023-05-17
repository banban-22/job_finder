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
    resources :reviews
  end

  resource :sessions

  resources :users
end
