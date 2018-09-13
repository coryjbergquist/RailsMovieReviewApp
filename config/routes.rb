Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # namespace :admin do
  #   resources :reviews
  #   resources :movies
  #   resources :users
  # end

  resources :movies

  resources :movies do
    resources :reviews, controller: 'movie_reviews'
  end

  resources :reviews, only: [:index, :new, :create, :show]
  resources :users
  resources :sessions, only: [:new]
  get '/login', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  get 'top_movies' => 'movies#top_movies'
  root 'movies#index'

  get 'users/:id/user_data', to: 'users#user_data'

end
