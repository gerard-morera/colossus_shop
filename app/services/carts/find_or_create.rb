module Carts
  class FindOrCreate
    def initialize params
      @params = params
    end

    def call
      if cart_id.nil?
        Cart.create
      else
        Cart.find(cart_id)
      end
    end

    private

    attr_reader :params

    delegate :cart_id, to: :params
  end
end