class AddColumnToCategorization < ActiveRecord::Migration
  def change
    add_column :categorizations, :category_id,    :integer
    add_column :categorizations, :subcategory_id, :integer
  end
end
