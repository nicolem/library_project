class CreateLendableBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :lendable_books do |t|
      t.integer :parent_book_id, :null => false
      t.integer :library_id, :null => false
      t.integer :borrower_id
      t.integer :status
      t.datetime :due_date

      t.timestamps
    end
  end
end
