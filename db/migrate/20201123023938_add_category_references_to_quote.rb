class AddCategoryReferencesToQuote < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :category, index: true
  end
end
