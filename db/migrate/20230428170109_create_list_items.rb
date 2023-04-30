class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.references :bill, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :amount
      t.string :name

      t.timestamps
    end
  end
end
