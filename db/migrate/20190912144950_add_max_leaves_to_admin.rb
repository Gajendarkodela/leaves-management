class AddMaxLeavesToAdmin < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :max_leaves, :integer
  end
end
