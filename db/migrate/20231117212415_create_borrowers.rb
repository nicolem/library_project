class CreateBorrowers < ActiveRecord::Migration[6.1]
  def change
    create_table :borrowers do |t|
      t.string :name, :null => false
      t.string :credit_card, :null => false

      t.timestamps
    end
    add_index :borrowers, [:name, :credit_card], unique: true
  end
end
