FactoryBot.define do
  factory :parent_book do
    title { Faker::Book.title }
    author { Faker::Book.author}
    isbn { SecureRandom.uuid }
  end
end
