class AddImageForOrderToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :image_for_order, :string
  end
end
