class CategoryParams
  def intialize raw_params
    @raw_params = raw_params
  end

  def category_id
    raw_params.require('id').to_i
  end

  def category_params
    params.fetch :title
  end

  private

  def params
    raw_params.require(:category).permit(:title)
  end



  attr_reader :raw_params
end