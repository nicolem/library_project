class LibrariesController < ApplicationController

  def create
    @library = Library.new(library_params)

    if @library.save
      render json: @library, status: :created
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:name)
    end
end
