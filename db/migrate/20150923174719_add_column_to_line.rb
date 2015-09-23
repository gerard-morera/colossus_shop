class AddColumnToLine < ActiveRecord::Migration
  def change
    add_column :lines, :product_id, :integer
    add_column :lines, :cart_id,    :integer
  end
end
