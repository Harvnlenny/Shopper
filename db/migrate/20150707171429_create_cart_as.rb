class CreateCartAs < ActiveRecord::Migration
  def change
    create_table :cart_as do |t|
      t.integer :total

      t.timestamps null: false
    end
  end
end
