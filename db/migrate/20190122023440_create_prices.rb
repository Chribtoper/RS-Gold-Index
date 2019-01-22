class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.string :price
      t.integer :site_id
      t.timestamps
    end
  end
end