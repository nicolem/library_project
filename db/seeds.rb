# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

library1 = Library.create(name: "North")
library2 = Library.create(name: "Central")
library3 = Library.create(name: "South")
jk = "J.K. Rowling"

book1 = ParentBook.create(title: "Harry Potter and the Sorcerer’s Stone", author: jk, isbn: "978-1338878929")
book2 = ParentBook.create(title: "Harry Potter and the Chamber of Secrets", author: jk, isbn: "978-1338878936")
book3 = ParentBook.create(title: "Harry Potter and the Prisoner of Azkaban", author: jk, isbn: "978-1338299168")
book4 = ParentBook.create(title: "Harry Potter and the Goblet of Fire", author: jk, isbn: "978-1338878950")
book5 = ParentBook.create(title: "Harry Potter and the Order of the Phoenix", author: jk, isbn: "978-1338299182")
book6 = ParentBook.create(title: "Harry Potter and the Half-Blood Prince", author: jk, isbn: "978-1338878974")
book7 = ParentBook.create(title: "Harry Potter and the Deathly Hallows", author: jk, isbn: "978-1338878981")

Library.all.each do |l|
  ParentBook.all.each do |pb|
    rand(0..2).times do
      LendableBook.create(library_id: l.id, parent_book_id: pb.id)
    end
  end
end

borrower1 = Borrower.create(name: "John Doe", credit_card: "1239-3492-3949-3943", library_ids: [library1.id, library2.id, library3.id])
borrower2 = Borrower.create(name: "Bob Smith", credit_card: "2834-2394-4581-2949", library_ids: [library2.id])
borrower3 = Borrower.create(name: "Mary Poppins", credit_card: "3920-5848-3847-1839", library_ids: [library3.id])

LendableBook.available.where(library_id: 1).order(Arel.sql('RANDOM()')).limit(2).update_all(borrower_id: borrower1.id, status: 1, due_date: Date.today+1.week)
LendableBook.available.where(library_id: 2).order(Arel.sql('RANDOM()')).limit(1).update_all(borrower_id: borrower1.id, status: 1, due_date: Date.today+1.week)
LendableBook.available.where(library_id: 3).order(Arel.sql('RANDOM()')).limit(1).update_all(borrower_id: borrower1.id, status: 1, due_date: Date.today+1.week)
LendableBook.available.where(library_id: 2).order(Arel.sql('RANDOM()')).limit(3).update_all(borrower_id: borrower2.id, status: 1, due_date: Date.today+3.days)
LendableBook.available.where(library_id: 3).order(Arel.sql('RANDOM()')).limit(1).update_all(borrower_id: borrower3.id, status: 1, due_date: Date.today-3.days)

