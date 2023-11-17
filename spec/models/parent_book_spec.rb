require 'rails_helper'

RSpec.describe ParentBook, type: :model do
  it 'is not valid without title' do
    book = FactoryBot.build(:parent_book, title: nil)
    expect(book).to_not be_valid
  end
  it 'is not valid without author' do
    book = FactoryBot.build(:parent_book, author: nil)
    expect(book).to_not be_valid
  end
  it 'is not valid without author' do
    book = FactoryBot.build(:parent_book, isbn: nil)
    expect(book).to_not be_valid
  end
  it 'is not valid if duplicate title, author, and isbn combination' do
    book1 = FactoryBot.create(:parent_book)
    book2 = FactoryBot.build(:parent_book,
      title: book1.title,
      author: book1.author,
      isbn: book1.isbn
    )
    expect(book2).to_not be_valid
  end
end
