Rails.application.routes.draw do
  root 'visuals#index'

  get '/secret' => 'page#secret'
  get '/register' => 'users#new'

  resources :users do
    resources :visuals
  end
  resources :visuals

  # These routes will be for showing a login form, logging in, and logging out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
