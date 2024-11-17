class CreateBorrowings < ActiveRecord::Migration[7.1]
  def change
    create_table :borrowings do |t|
      t.references :member, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
