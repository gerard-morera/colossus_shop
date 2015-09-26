describe Categories::FindOrCreate do
  let(:params)   { double 'params', title: a_title }
  let(:a_title)  { 'home' }

  subject { described_class.new params }

  describe '#call' do
    context 'with a new title' do
      it 'creates a category' do
        category = subject.call
        expect(Category.last).to eq category
      end
    end


    context 'when category already exists' do
      describe '#call' do
        it 'finds the category' do
          category  = subject.call
          category2 = subject.call
          expect(Category.all).to eq [category2]
        end
      end
    end
  end
end