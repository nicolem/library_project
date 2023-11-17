FactoryBot.define do
  factory :lendable_book do
    parent_book_id { FactoryBot.create(:parent_book).id }
    library_id { FactoryBot.create(:library).id }
    borrower_id { nil }
    status { 0 }
    due_date { Time.now+1.week }
  end
end
