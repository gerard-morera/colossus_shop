class LinesController < ApplicationController
  before_action :set_cart, only: [:create]

  def create
    product = Product.find(product_id)
    line    = product.lines.create
    
    line.attach_to cart_id
    render nothing: true
  end

  private

  def product_id
    params.permit(:product_id).fetch(:product_id)
  end

  def cart_id
    session[:cart_id]
  end

  def set_cart
    unless session[:cart_id]
      session[:cart_id] = Cart.create.id
    end
    binding.pry
  end
end