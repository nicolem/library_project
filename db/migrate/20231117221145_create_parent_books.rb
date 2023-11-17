class CreateParentBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :parent_books do |t|
      t.string :title, :null => false
      t.string :author, :null => false
      t.string :isbn, :null => false

      t.timestamps
    end
    add_index :parent_books, [:title, :author, :isbn], unique: true
  end
end
