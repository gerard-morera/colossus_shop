class Category < ActiveRecord::Base
  has_many :products, through: :products_categories
  has_many :products_categories
  has_many :subcategories, through: :categorizations
  has_many :categorizations

  accepts_nested_attributes_for :subcategories

  validates :title, presence: true
end