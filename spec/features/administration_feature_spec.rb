require 'rails_helper'

feature 'administrator management' do
  scenario 'administrator views the products' do
    visit '/admin/products'

    expect(page).to have_content('no products')
  end

  scenario 'administrator insert products' do
    visit '/admin/products'
    
    fill_in 'name', with: "Headphones"
    fill_in 'description', "Bluetooth, high quality."
    click_button 'submit'

    expect(page).to have_content('product inserted')
  end
end