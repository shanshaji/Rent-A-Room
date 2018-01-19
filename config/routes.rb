Rails.application.routes.draw do
  resources :bookings
  resources :amenities
  devise_for :users
  resources :cities
  get 'rooms/my_rooms'
  resources :rooms
  root 'rooms#index'
  end