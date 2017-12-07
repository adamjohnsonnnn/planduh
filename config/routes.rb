Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

  resources :survey_questions do
    resources :user_responses
  end

  resources :password_resets

  resources :user_responses

  resources :itineraries

  resources :surveys

  resources :sessions, only: [:new, :create, :destroy]

  resources :preferences, only: [:new, :create, :destroy]

  resources :terms_of_use, only: [:index]

  root "itineraries#new"

  get 'logout', to: "sessions#destroy", as: 'logout'

  get '/itineraries/:id/delete', to: "itineraries#destroy", as: 'delete'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
