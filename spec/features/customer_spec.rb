  require 'rails_helper'

feature 'Adding to cart' do
  context "when customer selects a product" do
    before do
      create_category("sport")
      create_product("26 wheel Roadmaster bike", "color blue", "sport")
    end

    it 'is saved within their cart' do
      visit '/'
      expect { click_button "Add to Cart" }.to change(Cart, :count).by(1)
    end

    it 'appears in their cart', js: true do
      visit '/'
      click_button "Add to Cart"

      expect(page).to have_content("26 wheel Roadmaster bike")
    end
  end

  def create_product(name, description, category)
    Product.create(
      name: name, 
      description: description, 
      category_ids: create_category(category).id
    )
  end

  def create_category name
    Category.create(title: name)
  end
end
