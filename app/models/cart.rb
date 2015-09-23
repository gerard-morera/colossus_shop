class Cart < ActiveRecord::Base
  has_many :lines
end
