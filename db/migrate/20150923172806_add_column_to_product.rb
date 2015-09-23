class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :line_id, :integer
  end
end
