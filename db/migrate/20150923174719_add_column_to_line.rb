class AddColumnToLine < ActiveRecord::Migration
  def change
    add_column :lines, :product_id, :integer
  end
end
