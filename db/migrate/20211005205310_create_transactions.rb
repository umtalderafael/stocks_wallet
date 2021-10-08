class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :date
      t.references :broker, foreign_key: true
      t.references :transaction_type, foreign_key: true
      t.references :user, foreign_key: true
      t.references :investment, foreign_key: true
      t.integer :amount
      t.decimal :value, precision: 6, scale: 2

      t.timestamps
    end
  end
end
