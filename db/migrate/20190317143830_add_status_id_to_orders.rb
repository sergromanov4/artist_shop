class AddStatusIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status_id, :integer , default: 1
    add_index :orders, :status_id
  end
end
