class AddBalanceToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :balance, :decimal, precision: 10, scale: 2
  end
end
