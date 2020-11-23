class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :price_cents
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :cost_cents
      t.decimal :cost, :precision => 8, :scale => 2
      t.integer :total_cents
      t.decimal :total, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
