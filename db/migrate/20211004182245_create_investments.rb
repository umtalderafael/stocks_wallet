class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.string :code, limit: 100
      t.string :company, limit: 100
      t.string :country_code, limit: 2
      t.references :investment_type, foreign_key: true

      t.timestamps
    end
  end
end
