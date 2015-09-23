class LinesController < ApplicationController
  def create
    product = Product.find(product_id)
    line    = product.create_line
    
    line.add_to cart_id

    render nothing: true
  end

  def product_id
    params.permit(:product_id).fetch(:product_id)
  end

  def cart_id
    session[:cart_id].fetch(:cart_id)
  end
end