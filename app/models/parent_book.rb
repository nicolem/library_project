class ParentBook < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :title, uniqueness: { scope: [:author, :isbn] }

  has_many :lendable_books
end
