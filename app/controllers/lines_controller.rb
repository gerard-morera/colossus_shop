class LinesController < ApplicationController
  def create
    product = Product.find(product_id)
    line    = product.lines.create
    
    line.set cart_id

    render nothing: true
  end

  def product_id
    params.permit(:product_id).fetch(:product_id)
  end

  def cart_id
    #comprovar!!!!
    session[:cart_id].fetch(:cart_id)
  end
end