Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'

  resources :students
  resources :lessons, except: :destroy


  get '/monthly_instructor', to: 'instructors#monthly'

  resources :instructors do
    resources :reports
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#delete"

  get '/auth/github/callback', to: 'sessions#create'


end
