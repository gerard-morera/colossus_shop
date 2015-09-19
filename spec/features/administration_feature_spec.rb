 require 'rails_helper'

feature 'administrator management' do
  scenario 'administrator insert products' do
    visit '/admin/products/new'

    fill_in 'name', with: "Ball"
    click_button 'submit'

    expect(page).to have_content('product inserted')
  end
end