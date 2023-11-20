class LendableBook < ApplicationRecord
  validates :parent_book_id, :library_id, presence: true

  belongs_to :parent_book
  belongs_to :library
  belongs_to :borrower, optional: true

  enum status: { available: 0, checked_out: 1 }

  scope :by_availability, -> { reorder(status: :asc, due_date: :asc) } #sort by availiability and then soonest due date

  def available_string
    available? ? status : due_date
  end
end
