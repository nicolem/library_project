class BorrowersController < ApplicationController
  def create
    borrower.libraries << library unless borrower.libraries.include?(library)

    if borrower.save
      render json: borrower, status: :created
    else
      render json: borrower.errors, status: :unprocessable_entity
    end
  end

  private
    def borrower
      @borrower ||= Borrower.find_or_create_by(borrower_params)
    end

    def library
      Library.find(params[:library_id])
    end

    def borrower_params
      params.require(:borrower).permit(:name, :credit_card)
    end
end
