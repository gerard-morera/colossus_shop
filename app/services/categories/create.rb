module Categories
  class Create
    def initialize params, creatable_class: Categories::Creatable
      @params          = params
      @creatable_class = creatable_class
    end

    def call
      category    = create(creatable(category_params))
      subcategory = category.subcategories(create(creatable subcategory_params))
    end

    private

    attr_reader :params, :creatable_class

    def create category_params
      Category.find_or_create_by category_params
    end

    def creatable params
      creatable_class.new(params).call
    end

    def category_params 
      params.require(:category).permit(:title)
    end

    def subcategory_params
      @subcategory_params ||= params.require(:category).permit(:subcategory => :title).values.first
    end
  end
end