class CategoryParams
  def initialize raw_params
    @raw_params = raw_params
  end

  def category_id
    raw_params.fetch :id
  end

  def category_params
    params.permit(:title)
  end

  def subcategory_params
    params.permit(:subcategory => :title).fetch :subcategory
  end

  private

  def params
    raw_params.require :category
  end

  attr_reader :raw_params
end