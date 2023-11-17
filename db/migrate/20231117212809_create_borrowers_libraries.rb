class CreateBorrowersLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :borrowers_libraries, :id => false do |t|
      t.column "borrower_id", :integer, :null => false
      t.column "library_id",  :integer, :null => false
    end
    add_index :borrowers_libraries, [:borrower_id, :library_id], unique: true
  end
end
