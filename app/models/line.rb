class Line < ActiveRecord::Base
  belongs_to :products
  belongs_to :cart

  def add_to cart_id
    self.cart = Cart.find(cart_id)
  end
end
