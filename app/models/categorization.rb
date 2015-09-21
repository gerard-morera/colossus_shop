class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory, class_name: "Category"
end
