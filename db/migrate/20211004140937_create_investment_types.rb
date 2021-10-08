class CreateInvestmentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :investment_types do |t|
      t.string :name, limit: 30
      t.text :description

      t.timestamps
    end
  end
end
