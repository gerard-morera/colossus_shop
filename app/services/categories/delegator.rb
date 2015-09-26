module Categories
  class Delegator
    def initialize params, find_or_create_class: FindOrCreate
      @find_or_create_class = find_or_create_class
      @params               = params
    end

    def call
      category = find_or_create 

      if subcategory?
        @group = :subcategory

        category.subcategories find_or_create
      end
    end

    private

    attr_reader :params, :find_or_create_class, :group

    def find_or_create
      find_or_create = find_or_create_class.new params, group
      find_or_create.call
    end


    def subcategory?
      subcategory_params.fetch :title
    end

    delegate :subcategory_params, to: :params
  end
end