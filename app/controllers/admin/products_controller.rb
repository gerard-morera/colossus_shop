module Admin 
  class ProductsController < ApplicationController
    def index
      @products = Product.all
    end

    def new
      @new_product = Product.new
    end

    def create
      Product.create product_params

      redirect_to admin_products_path
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end
  end
end