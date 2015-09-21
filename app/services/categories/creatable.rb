module Categories
  class Creatable
    def initialize category_params
      @category_params = category_params
    end

    def call
      if has_value?
        category_params
      else
        nil
      end
    end

    private

    attr_reader :category_params
   
     def has_value? 
      !category_params.values.first.empty?
    end
  end
end