class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :price_publix
      t.integer :price_winn_dixie
      t.string :name
      t.string :description
      t.string :category

      t.timestamps null: false
    end
  end
end
