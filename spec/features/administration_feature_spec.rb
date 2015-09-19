require 'rails_helper'

feature 'administrator management' do
  scenario 'administrator insert products' do
    visit '/admin/products/new'

    fill_in 'name', with: "Headphones"
    fill_in 'description', "Bluetooth, high quality."
    click_button 'submit'

    expect(page).to have_content('product inserted')
  end
end