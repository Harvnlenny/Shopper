class AddSavingsToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :savings, :integer
  end
end
