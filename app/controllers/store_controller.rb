class StoreController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by product_id
  end

  def product_id
    params.permit('id')
  end
end