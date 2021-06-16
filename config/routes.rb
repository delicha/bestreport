Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users do
      post :import, on: :collection
    end
  end

  resources :students do
    post :import, on: :collection
  end
  
  root to: 'reports#index'

  resources :reports do
    post :import, on: :collection
  end

  get '/unsent', to: 'reports#unsent'
end
