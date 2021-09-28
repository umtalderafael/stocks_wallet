class AddBornAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :born_at, :date
  end
end