 require 'rails_helper'

feature 'administrator management' do

  scenario 'administrator views the products' do
    visit '/admin/products'

    expect(page).to have_selector('add_product')
  end

  scenario 'administrator insert products' do
    visit '/admin/products/new'

    fill_in 'name', with: "Ball"
    click_button 'submit'

    expect(page).to have_content('product inserted')
  end
end