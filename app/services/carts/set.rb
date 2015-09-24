module Carts
  class Set
    def initialize *cart_id
      @cart_id = cart_id
    end

    def call
      
    end

    private

    attr_reader :cart_id
  end
end