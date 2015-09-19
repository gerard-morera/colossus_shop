module Admin 
  class ProductsController < ApplicationController
    def new
      @new_product = Product.new
    end

    def create
    end
  end
end