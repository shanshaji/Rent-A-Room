Rails.application.routes.draw do
  resources :special_prices
  resources :bookings
  resources :amenities
  devise_for :users
  resources :cities
  get 'rooms/my_rooms'
  get 'rooms/authorize_rooms'
  resources :rooms
  root 'rooms#index'
  end
