class BorrowersController < ApplicationController
  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      render json: @borrower, status: :created
    else
      render json: @borrower.errors, status: :unprocessable_entity
    end
  end

  private
    def borrower_params
      params.require(:borrower).permit(:name, :credit_card, library_ids: [])
    end
end
