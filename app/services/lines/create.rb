module Lines
  class Create
    def initialize params
      @params = params
    end

    def call
      cart.lines.create product: product
    end

    private

    def cart 
      cart_finder = Carts::FindOrCreate.new(params)
      cart_finder.call
    end

    def product
      Product.find product_id
    end

    attr_reader :params

    delegate :product_id, to: :params
  end
end