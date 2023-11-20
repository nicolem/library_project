class Borrower < ApplicationRecord
  validates :name, :credit_card, presence: true
  validates :name, uniqueness: { scope: :credit_card }

  has_and_belongs_to_many :libraries
  has_many :lendable_books

  scope :bad_standing, -> {
    includes(:lendable_books)
    .where('lendable_books.due_date < ?', Date.today)
    .references(:lendable_books)
  }

  scope :good_standing, -> {
    where.not(id: bad_standing)
  }
end
