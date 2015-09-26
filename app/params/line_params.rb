class LineParams
  def initialize raw_params, session
    @raw_params  = raw_params
    @session     = session
  end

  def cart_id
    session[:cart_id]
  end

  def product_id
    params
  end

  private

  attr_reader :raw_params, :session

  def params
    raw_params.require("product_id")
  end
end