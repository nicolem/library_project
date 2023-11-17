class LendableBook < ApplicationRecord
  validates :parent_book_id, :library_id, presence: true

  belongs_to :parent_book
  belongs_to :library
end
