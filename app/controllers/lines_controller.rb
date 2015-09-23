class LinesController < ApplicationController
  def create
    line = Line.create(product_ids: product_id)

    render json: line
  end

  def product_id
    params.permit(:product_id).values
  end
end