class CreateFundamentalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :fundamental_infos do |t|
      t.references :investment, foreign_key: true
      t.text :info
      t.text :institutional_holders

      t.timestamps
    end
  end
end
