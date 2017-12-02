Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

  resources :survey_questions, only: [:show] do
    resources :survey_responses
  end

  resources :itineraries

  resources :sessions, only: [:new, :create, :destroy]

  resources :preferences, only: [:new, :create, :destroy]

  root "users#index"

  get 'logout', to: "sessions#destroy", as: 'logout'

end
