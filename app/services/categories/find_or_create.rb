module Categories
  class FindOrCreate
    def initialize params, *group
      @params = params
      @group  = group
    end

    def call
      Category.find_or_create_by required_category_params  
    end

    private

    def required_category_params
      if group.first.nil?
        category_params
      else
        subcategory_params
      end
    end

    attr_reader :group, :params

    delegate :category_params, :subcategory_params, to: :params
  end
end