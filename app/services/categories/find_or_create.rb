module Categories
  class FindOrCreate
    def initialize params
      @params = params
    end

    def call
      Category.find_or_create_by title: title  
    end

    private

    attr_reader :params

    delegate :title, to: :params
  end
end