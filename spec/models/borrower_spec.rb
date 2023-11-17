require 'rails_helper'

RSpec.describe Borrower, type: :model do
  it 'is not valid without name' do
    borrower = FactoryBot.build(:borrower, name: nil)
    expect(borrower).to_not be_valid
  end
  it 'is not valid without credit card' do
    borrower = FactoryBot.build(:borrower, credit_card: nil)
    expect(borrower).to_not be_valid
  end

  it 'needs unique name and credit card combination' do
    borrower1 = FactoryBot.create(:borrower)
    borrower2 = FactoryBot.build(:borrower, name: borrower1.name, credit_card: borrower1.credit_card)
    expect(borrower2).to_not be_valid
  end
end
