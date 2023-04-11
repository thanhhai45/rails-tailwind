class AddPropertyReferenceToBills < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :property, null: false, foreign_key: true
  end
end
