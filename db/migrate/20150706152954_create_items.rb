class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :Price_Publix
      t.integer :Price_Winn_Dixie
      t.string :Name
      t.string :Description
      t.string :Category

      t.timestamps null: false
    end
  end
end
