class AddOrderIdToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :order_id, :integer
  end
end
