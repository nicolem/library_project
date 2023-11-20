class ParentBooksController < ApplicationController

  def create #creates new lendable book record under existing or new parent
    @parent_book = ParentBook.where(parent_book_params).first_or_initialize

    if @parent_book.save
      if @parent_book.lendable_books.create(library_id: params[:library_id])
        render json: @parent_book, status: :created
      end
    else
      render json: @parent_book.errors, status: :unprocessable_entity
    end
  end

  def index #return books by title search
    if params[:global_search]
      books = LendableBook.available.includes(:parent_book, :library).where('parent_books.title LIKE ?', "%#{params[:search]}%").references(:parent_books)
      render json: books
    else
      books = ParentBook.includes(:lendable_books).where(lendable_books: {library_id: params[:library_id]}).where('title LIKE ?', "%#{params[:search]}%")
      render json: books
    end
  end

  def lend
    borrower = Borrower.good_standing.find(params[:borrower_id])
    lendable_book = ParentBook.find(params[:parent_book_id]).lendable_books.where(library_id: borrower.library_ids).available.first
    if lendable_book.present? && borrower.present?
      lendable_book.update(borrower_id: borrower.id, due_date: Date.today+1.week, status: 1)
      render json: lendable_book
    else
      render json: {"error": "unable to find available book for library member"}
    end
  end

  def return
    returned_book = LendableBook.find(params[:book_id])
    if returned_book.update(borrower_id: nil, due_date: nil, status: 0, library_id: params[:library_id])
       render json: returned_book
    else
      render json: returned_book.errors, status: :unprocessable_entity
    end
  end

  private
    def parent_book_params
      params.require(:parent_book).permit(:title, :author, :isbn)
    end
end
