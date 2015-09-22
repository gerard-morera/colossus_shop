describe Category do
  it 'is valid with a title' do
    category = Category.new(title: "home")
    category.valid?
    expect(category).to be_valid
  end

  it 'is invalid without a title' do
    category = Category.new(title: nil)
    category.valid?
    expect(category.errors[:title]).to include("can't be blank")
  end
end