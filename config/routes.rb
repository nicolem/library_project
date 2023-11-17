Rails.application.routes.draw do
  resources :libraries, only: [:create]
end
