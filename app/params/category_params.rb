class CategoryParams
  def intialize raw_params
    @raw_params = raw_params
  end

  def category_id
    raw_params.require('id').to_i
  end

  private

  attr_reader :raw_params
end