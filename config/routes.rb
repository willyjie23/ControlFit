Rails.application.routes.draw do
  devise_for :members, controllers: {registrations: 'members/registrations' ,omniauth_callbacks: 'members/omniauth_callbacks' }
  resource :member, only: :show do
    member do
      get :following, :followers
    end
  end

  resource :relationships, only:[:create, :destroy]
  
  resources :records
  root 'records#index'
  resources :users
  resources :record_databases
  resources :exercise_records
  resources :food_records
  resources :demands
  resources :blogs

  get '/search_food' => 'record_databases#search_food', :as => 'search_food_record_database'
  get '/search_sport' => 'record_databases#search_sport', :as => 'search_sport_record_database'
end
