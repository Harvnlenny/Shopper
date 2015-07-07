class CreateCartBs < ActiveRecord::Migration
  def change
    create_table :cart_bs do |t|
      t.integer :total

      t.timestamps null: false
    end
  end
end
