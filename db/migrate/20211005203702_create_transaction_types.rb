class CreateTransactionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_types do |t|
      t.string :operation, limit: 1
      t.string :name, limit: 40
      t.text :description

      t.timestamps
    end
  end
end
