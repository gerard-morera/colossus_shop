describe Lines::Create do
  let(:product)  do
    Product.create!(
      name:        "cocadrink",
      description: "best coca flavour"
    ) 
  end

  let(:params)   { double 'params', product_id: product.id}

  subject { described_class.new params }

  let(:cart)        { Cart.create! }
  let(:cart_finder) { double 'cart_finder', :call => cart }

  before do
    allow(Carts::FindOrCreate).to receive(:new).
    with(params).and_return(cart_finder)
  end 

  describe '#call' do
    it 'creates a line on a given cart' do
      line = subject.call
      expect(cart.lines.last).to eq line
      expect(line.product).to eq product
    end
  end
end