class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
