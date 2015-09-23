class LinesController < ApplicationController
  def create
    product = Product.find(product_id)
    product.lines.create
        
    render nothing: true
  end

  def product_id
    params.permit(:product_id).fetch(:product_id)
  end
end