class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :quantity
      t.float :inventory_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
