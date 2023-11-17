FactoryBot.define do
  factory :borrower do
    name { Faker::Name.name }
    credit_card { Faker::Finance.credit_card }
    libraries { [FactoryBot.create(:library)] }
  end
end
