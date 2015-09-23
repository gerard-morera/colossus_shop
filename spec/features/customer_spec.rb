feature 'customer interaction' do
  scenario 'customer can select a product to cart' do
    visit '/'

    clink_link "26 wheel Roadmaster bike"
    click_button "Add to Cart"
    
    expect(page).to have_content("26 wheel Roadmaster bike x 1")
  end
end