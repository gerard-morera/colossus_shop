class Line < ActiveRecord::Base
  belongs_to :product, inverse_of: :lines
  belongs_to :cart, inverse_of: :lines

  def attach_to cart_id
    update(cart_id: cart_id)
  end
end
