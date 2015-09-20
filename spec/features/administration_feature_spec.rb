require 'rails_helper'

feature 'administrator management' do
  scenario 'administrator views the products' do
    visit '/admin/products'

    expect(page).to have_content('no products')
  end

  scenario 'administrator insert a product' do
    visit '/admin/products'

    click_link 'insert new product'

    fill_in 'name',        with: "Headphones"
    fill_in 'description', with: "Bluetooth, high quality."
    fill_in 'category',    with: "Electronics & Computers"
    click_button 'submit'

    expect(page).to have_content('Headphones')
  end

  scenario 'administrator insert a product with 2 categories' do
    visit '/admin/products'

    click_link 'insert new product'

    fill_in 'name',        with: "cotton-sheet"
    fill_in 'description', with: "cotton, double bed"
    fill_in 'category',    with: "home"
    fill_in 'category',    with: "cloth"
    click_button 'submit'

    expect(page).to have_content('home')
    expect(page).to have_content('cloth')
  end
end