Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :examples do
    collection do
      get :properties
    end
  end
end
