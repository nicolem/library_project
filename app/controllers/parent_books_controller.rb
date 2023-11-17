class ParentBooksController < ApplicationController

  def create
    @parent_book = ParentBook.where(parent_book_params).first_or_initialize

    if @parent_book.save
      if @parent_book.lendable_books.create(library_id: params[:library_id])
        render json: @parent_book, status: :created
      end
    else
      render json: @parent_book.errors, status: :unprocessable_entity
    end
  end

  private
    def parent_book_params
      params.require(:parent_book).permit(:title, :author, :isbn)
    end
end
