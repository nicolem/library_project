class ParentBook < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :title, uniqueness: { scope: [:author, :isbn] }

  has_many :lendable_books

  def next_available
    lendable_books.by_availability.first
  end
end
