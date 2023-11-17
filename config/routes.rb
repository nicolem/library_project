Rails.application.routes.draw do
  resources :borrowers, only: [:create]
  resources :libraries, only: [:create] do
    resources :parent_books, :path => 'books', only: [:create]
  end
end
