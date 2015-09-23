class Product < ActiveRecord::Base
  has_many :categories, through: :products_categories
  has_many :products_categories
  belongs_to :line

  validates :name, :description, :categories, presence: true
end

