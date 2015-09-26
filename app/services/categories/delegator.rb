module Categories
  class Delegator
    def initialize params, find_or_create_class: FindOrCreate
      @find_or_create_class = find_or_create_class
      @params               = params
    end

    def call
      category = find_or_create params

      if subcategory?
        category.subcategories find_or_create subcategory_params
      end
    end

    private

    attr_reader :params, :find_or_create_class

    def find_or_create params
      find_or_create = find_or_create_class.new params
      find_or_create.call
    end

    delegate :subcategory_params, :subcategory?, to: :params
  end
end