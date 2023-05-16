Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "home#index"

  # patch '/jobs/:id/edit', to: 'jobs#update', as: 'job_update'

  resources :jobs do
    resources :reviews
  end

  resource :sessions

  resources :users
end
