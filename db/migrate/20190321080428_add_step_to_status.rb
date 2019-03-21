class AddStepToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :step, :integer
  end
end
