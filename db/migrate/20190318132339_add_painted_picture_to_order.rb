class AddPaintedPictureToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :painted_picture, :string
  end
end
