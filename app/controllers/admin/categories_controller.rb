module Admin
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      Category.create category_params

      redirect_to admin_categories_path
    end

    def category_params
      params.require(:category).permit(:title)
    end
  end
end