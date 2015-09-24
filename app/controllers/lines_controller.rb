class LinesController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(product_id)
    line    = product.lines.create
    
    line.attach_to cart_id

    redirect_to controller: :store, action: :index
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
  end
end