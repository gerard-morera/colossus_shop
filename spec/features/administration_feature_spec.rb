require 'rails_helper'

feature 'administrator management' do
  scenario 'administrator views the products' do
    visit '/admin/products'

    expect(page).to have_content('no products')
  end

  scenario 'administrator insert a product' do
    create_category("Electronics & Computers")
    visit '/admin/products'
    click_link 'insert new product'

    fill_in 'name',        with: "Headphones"
    fill_in 'description', with: "Bluetooth, high quality."
    check("Electronics & Computers")  
    click_button 'submit'

    expect(page).to have_content('Headphones')
  end

  scenario 'administrator insert a product with 2 categories' do
    create_category("home")
    create_category("cloth")
    visit '/admin/products'
    click_link 'insert new product'

    fill_in 'name',        with: "sheet"
    fill_in 'description', with: "cotton, double bed"
    check('home')  
    check('cloth')    
    click_button 'submit'

    expect(page).to have_content('home')
    expect(page).to have_content('cloth')
  end

  scenario 'administrator insert categories' do
    visit '/admin/products'
    click_link 'insert new category'

    fill_in 'title', with: "camping"
    click_button 'submit'

    expect(page).to have_content 'camping'
  end

  scenario 'administrator inserts category with subcategories' do
    visit 'admin/categories'
    click_link 'insert new category'

    fill_in 'title',       with: "music"
    fill_in 'subcategory', with: "pianos"
    click_button 'submit'

    expect(page).to have_content 'music'
    expect(page).to have_content 'pianos'
  end

  def create_category name
    Category.create(title: name)
  end
end