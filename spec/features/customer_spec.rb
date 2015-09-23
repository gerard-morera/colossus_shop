feature 'customer interaction' do
  scenario 'customer can select a product to cart' do
    create_category("sport")
    create_product("26 wheel Roadmaster bike", "color blue", "sport")
    
    visit '/'

    click_link "26 wheel Roadmaster bike"
    click_button "Add to Cart"
    
    expect(page).to have_content("26 wheel Roadmaster bike x 1")
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