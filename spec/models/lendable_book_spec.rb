require 'rails_helper'

RSpec.describe LendableBook, type: :model do
  it 'is not valid without parent_book' do
    book = FactoryBot.build(:lendable_book, parent_book_id: nil)
    expect(book).to_not be_valid
  end
  it 'is not valid without library' do
    book = FactoryBot.build(:lendable_book, library_id: nil)
    expect(book).to_not be_valid
  end
end
