Rails.application.routes.draw do
  resources :libraries, only: [:create] do
    resources :borrowers, only: [:create]
    resources :parent_books, :path => 'books', only: [:create, :index]
    post 'books/:parent_book_id/lend', :to => 'parent_books#lend'
    post 'books/return', :to => 'parent_books#return'
  end
end
