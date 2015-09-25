class CartsController < ApplicationController  
  def index
    cart = Cart.find(session[:cart_id])
    render json: (presenter cart).to_json
  end

  def presenter cart
    cart.lines.map do |line|
      line.product.name
    end
  end
end