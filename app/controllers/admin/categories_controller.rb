module Admin
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(id)
    end

    def new
      @category     = Category.new
      @subcategory  = Category.new
    end

    def create
      category = Categories::Delegator.new category_params
      category.call

      redirect_to admin_categories_path
    end

    private

    def id
      category_params.id
    end

    def category_params
      CategoryParams.new(params)
    end
  end
end