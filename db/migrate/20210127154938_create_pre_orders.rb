class CreatePreOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :pre_orders do |t|
      t.string :tracking_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
