require 'rails_helper'

feature 'administrator management' do
  scenario 'administrator views the products' do
    visit '/admin/products'

    expect(page).to have_content('no products')
  end

  scenario 'administrator insert products' do
    visit '/admin/products'

    click_link 'insert new product'

    fill_in 'name',        with: "Headphones"
    fill_in 'description', with: "Bluetooth, high quality."
    fill_in 'category',    with: "Electronics & Computers"
    click_button 'submit'

    expect(page).to have_content('Headphones')
  end

end