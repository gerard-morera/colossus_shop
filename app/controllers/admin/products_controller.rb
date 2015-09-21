module Admin 
  class ProductsController < ApplicationController
    def index
      @products = Product.all
    end

    def new
      @category = Category.all
      @product  = Product.new
    end

    def create
      Product.create product_params

      redirect_to admin_products_path
    end

    def product_params
      product_params = params.require(:product).permit(:name, :description)
      product_params.merge category_params
    end

    def category_params
      params[:product].select { |key,_| key == "category_ids" }
    end
  end
end