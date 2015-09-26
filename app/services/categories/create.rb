module Categories
  class Create
    def initialize params
      @params = params
    end

    def call
      (category = create category_params) && category.subcategories(create subcategory_params)
    end

    private

    attr_reader :params

    def create category_params
      if has_value? category_params
        Category.find_or_create_by category_params
      else
        nil
      end
    end
    
    # def category_params 
    #   params.require(:category).permit(:title)
    # end

    # def subcategory_params
    #   @subcategory_params ||= params.require(:category).permit(:subcategory => :title).values.first
    # end

    def has_value? category_params
      !category_params.values.first.empty?
    end

    delegate :category_params, :subcategory_params, to: :params
  end
end