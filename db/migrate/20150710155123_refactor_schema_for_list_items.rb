class RefactorSchemaForListItems < ActiveRecord::Migration
  def change
    drop_table :line_items
    drop_table :carts
    remove_column :items, :list_id
  end
end
