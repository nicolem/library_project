Rails.application.routes.draw do
  resources :borrowers, only: [:create]
  resources :libraries, only: [:create]
end
