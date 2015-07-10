class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :list, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :quantity, default: 0, null: false
      t.integer :subtotal, default: 0, null: false

      t.timestamps null: false
    end
  end
end

