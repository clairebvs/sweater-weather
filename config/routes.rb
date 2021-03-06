Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'forecast', to: "forecast#index"
      get 'backgrounds', to: "backgrounds#show"
      post 'users', to: 'user#create'
      post 'sessions', to: 'session#create'
      post 'favorites', to: 'favorite#create'
      get 'favorites', to: 'favorite#index'
    end
  end
end
