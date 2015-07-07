class SetDefaultsOnNumberCols < ActiveRecord::Migration
  def change
    change_column_default(:line_items, :quantity, 0)
    change_column_null(:line_items, :quantity, false)
    change_column_default(:line_items, :subtotal, 0)
    change_column_null(:line_items, :subtotal, false)
    change_column_default(:carts, :total, 0)
    change_column_null(:carts, :total, false)
    change_column_default(:items, :price_publix, 0)
    change_column_null(:items, :price_publix, false)
    change_column_default(:items, :price_winn_dixie, 0)
    change_column_null(:items, :price_winn_dixie, false)
  end
end
