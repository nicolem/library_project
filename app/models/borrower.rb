class Borrower < ApplicationRecord

  validates :name, presence: true, uniqueness: { scope: :credit_card }

  has_and_belongs_to_many :libraries
end
