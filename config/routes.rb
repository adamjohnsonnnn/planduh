Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

  resources :survey_questions do
    resources :user_responses
  end

  resources :user_responses

  resources :itineraries

  resources :surveys

  resources :sessions, only: [:new, :create, :destroy]

  resources :preferences, only: [:new, :create, :destroy]

  root "itineraries#new"

  get 'logout', to: "sessions#destroy", as: 'logout'
  get '/itineraries/:id/delete', to: "itineraries#destroy", as: 'delete'

end
