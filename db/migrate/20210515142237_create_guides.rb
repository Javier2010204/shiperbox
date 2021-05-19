class CreateGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|
      t.string :tacking
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
