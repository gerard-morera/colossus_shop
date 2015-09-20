class AddColumnToProductsCategories < ActiveRecord::Migration
  def change
    add_column :products_categories, :product_id, :integer
    add_column :products_categories, :category_id, :integer
  end
end
