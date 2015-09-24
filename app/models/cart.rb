class Cart < ActiveRecord::Base
  has_many :lines, inverse_of: :cart
end
