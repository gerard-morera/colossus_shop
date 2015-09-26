describe Product do
  it 'is valid with a name, description and category' do
    category = Category.create(title: "school")
    product  = Product.new(name: "pencil", description: "color blue", category_ids: category.id)
    product.valid?
    expect(product).to be_valid
  end

  it 'is invalid without a name' do
    product = Product.new(name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    product = Product.new(name: "pencil", description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end
end