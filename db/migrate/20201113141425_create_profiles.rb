class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name, default: 'Mi usuario ShiperBox'
      t.integer :phone
      t.date :birthday
      t.string :nit
      t.string :tax_residence
      t.string :business_name
      t.string :address
      t.text :delivery_instructions
      t.string :contact_name1
      t.integer :contact_phone1
      t.string :contact_name2
      t.integer :contact_phone2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
