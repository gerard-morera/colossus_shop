module Admin
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
      @category    = Category.new
      @sucategory  = Category.new
      # @subcategories = @category.subcategories.build
    end

    def create
      category = Categories::Create.new params
      category.call

      redirect_to admin_categories_path
    end
  end
end