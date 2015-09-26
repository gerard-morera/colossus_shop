class LinesController < ApplicationController
  def create
    line_creator = Lines::Create.new(line_params)
    line         = line_creator.call

    if line.valid?
      session[:cart_id] = line.cart_id
      render :json => line
    else
      render :json => "error", :status => 402
    end
  end

  private

  def line_params
    LineParams.new(params, session)
  end
end
