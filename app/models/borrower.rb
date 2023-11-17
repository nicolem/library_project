class Borrower < ApplicationRecord
  validates :name, :credit_card, presence: true
  validates :name, uniqueness: { scope: :credit_card }

  has_and_belongs_to_many :libraries
end
