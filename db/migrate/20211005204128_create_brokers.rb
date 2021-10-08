class CreateBrokers < ActiveRecord::Migration[5.2]
  def change
    create_table :brokers do |t|
      t.string :name, limit: 30
      t.string :code, limit: 20

      t.timestamps
    end
  end
end
