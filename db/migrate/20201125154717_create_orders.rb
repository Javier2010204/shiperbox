class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :code
      t.decimal :product_price, :precision => 8, :scale => 2, :default => 0.0
      #Ex:- :default =>''
      t.decimal :shipping_us, :precision => 8, :scale => 2, :default => 0.0
      t.integer :product_weight, :default => 1
      #Ex:- :default =>''
      t.boolean :shiperrbox_buy, :default => true
      #Ex:- :default =>''
      t.decimal :home_service, :precision => 8, :scale => 2, :default => 0.0
      t.string :link
      t.decimal :total, :precision => 8, :scale => 2, :default => 0.0
      t.string :status
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
