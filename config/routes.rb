Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "home#index"

  resources :jobs do
    resources :reviews
  end

  resource :sessions

  resources :users
end
