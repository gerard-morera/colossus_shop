module Admin
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find category_id
    end

    def new
      @category    = Category.new
      @sucategory  = Category.new
      # @subcategories = @category.subcategories.build
    end

    def create
      category = Categories::Create.new category_params
      category.call

      redirect_to admin_categories_path
    end

    def category_id
      params.require("id").to_i
    end

    def category_params
      CategoryParams.new(params)
    end
  end
end