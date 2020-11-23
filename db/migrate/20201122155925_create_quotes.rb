class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.integer :code
      t.decimal :product_price, :precision => 12, :scale => 8
      t.decimal :shipping_us, :precision => 12, :scale => 8
      t.integer :product_weight, :default => 1
      #Ex:- :default =>''
      t.string :category
      t.boolean :shiperbox_buy, :default => false
      #Ex:- :default =>''
      t.boolean :home_service, :default => true
      #Ex:- :default =>''
      t.decimal :home_service_option, :precision => 12, :scale => 8
      t.string :link
      t.decimal :total, :precision => 12, :scale => 8

      t.timestamps
    end
  end
end
