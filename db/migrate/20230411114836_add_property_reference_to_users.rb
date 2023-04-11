class AddPropertyReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :property, null: false, foreign_key: true
  end
end
