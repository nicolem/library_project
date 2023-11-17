require 'rails_helper'

RSpec.describe Library, type: :model do
  it 'is not valid without name' do
    library = FactoryBot.build(:library, name: nil)
    expect(library).to_not be_valid
  end

  it 'needs unique name' do
    library1 = FactoryBot.create(:library)
    library2 = FactoryBot.build(:library, name: library1.name)
    expect(library2).to_not be_valid
  end
end
