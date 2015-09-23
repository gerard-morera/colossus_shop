class LinesController < ApplicationController
  def create
    product = Product.find(product_id)
    line    = product.lines.create
    
    cart.add line

    render nothing: true
  end

  def product_id
    params.permit(:product_id).fetch(:product_id)
  end

  def cart
    Cart.find(session[:cart_id])
  end
end