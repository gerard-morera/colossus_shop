module Admin
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
      @category      = Category.new
      @subcategories = @category.subcategories.build
    end

    def create
      new_category = Category.create(category_params)

      unless subcategory_params.values.first.values.first.empty?
        new_category.subcategories.create(subcategory_params.values.first)
      end

      redirect_to admin_categories_path
    end

    def category_params
      params.require(:category).permit(:title)
    end

    def subcategory_params
      params.require(:category).permit(:subcategory => :title)
    end
  end
end