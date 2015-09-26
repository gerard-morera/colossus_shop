class CategoryParams
  def initialize raw_params
    @raw_params = raw_params
  end

  def id
    raw_params.fetch :id
  end

  def title
    params.fetch :title
  end

  def subcategory?
    not params[:subcategory].fetch(:title).empty?
  end

  def subcategory_params
    CategoryParams.new new_params_hash
  end

  private

  def params
    raw_params.require :category
  end

  def action_controller_parameters 
    @action_controller_parameters ||= ActionController::Parameters.new
  end

  def new_params_hash
    action_controller_parameters[:category] = params.fetch :subcategory
    action_controller_parameters   
  end

  attr_reader :raw_params
end

