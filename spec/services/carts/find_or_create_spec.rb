describe Carts::FindOrCreate do
  subject { FindOrCreate.new params }
  
  let(:params)  { double 'params', cart_id: value}
  let(:Cart)    { double 'Cart' }
  let(:cart_id) { value }
  let(:create)  { create }

  context "without an existing cart" do
    let(:value) { nil }
    
    it "creates a new cart" do
      allow(Cart).to receive(:create)

      subject.call
    end
  end

  context "with an existing cart" do 
    let(:value) { 5 }
    
    it "fins the cart" do
      allow(Cart).to receive(:find).with(cart_id)

      subject.call
    end
  end
end
