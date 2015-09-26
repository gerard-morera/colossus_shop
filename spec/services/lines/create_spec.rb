module Lines
  describe Create do
    let(:params)      { double 'params', product_id: 5 }
    let(:cart)        { Cart.create! }
    let(:cart_finder) { double 'cart_finder', :call => cart }
    let(:cart_lines)  { double "cart_lines",  :create => line }
    let(:line)        { Line.create! }
    let(:product)     { double 'product' }
    let(:create)      { double 'create' }
    let(:lines)       { double 'lines' }

    subject { Create.new params }
    
    before do
      allow(Carts::FindOrCreate).to receive(:new).
      with(params).and_return(cart_finder)
    end

    before do
      allow(cart).to receive(:lines).and_return(cart_lines)
    end

    before do
      allow(:cart_lines).to receive(:create).with(product).
      and_return(line)
    end

    it "creates a new line" do
      expect(subject.call).to eq(line)
    end
  end
end
