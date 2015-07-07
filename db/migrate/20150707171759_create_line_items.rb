class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :cart_a, index: true, foreign_key: true
      t.references :cart_b, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :quantity
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
