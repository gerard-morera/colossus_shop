describe Categories::Delegator do
  let(:find_or_create_class) { double 'find_or_create_class', new: find_or_create }
  
  let(:subcategory_params) { nil }
  let(:params) do 
    double 'params', 
      subcategory?: subcategory_params.present?,
      subcategory_params: subcategory_params
  end

  subject do 
    described_class.new(params, find_or_create_class: find_or_create_class) 
  end

  let(:category)                   { double 'category' }
  let(:find_or_create)             { double 'find_or_create', call: category }
  let(:subcategory_find_or_create) { double 'subcategory_find_or_create', call: category}

  let(:subcategories) { double 'subcategories' }


  before do
    allow(category).to receive(:subcategories)

    allow(find_or_create_class).to receive(:new).
      with(params).and_return(find_or_create)

    allow(find_or_create_class).to receive(:new).
      with(subcategory_params).and_return(subcategory_find_or_create)
  end

  describe '#call' do
    context 'with subcategory' do
      let(:subcategory_params) { double 'subcategory_params' }

      it 'calls find_or_create_class' do
        expect(find_or_create).to receive(:call) 
        expect(subcategory_find_or_create).to receive(:call)

        subject.call
      end
    end

    context 'without subcategory' do 
      it 'calls fin for both categories' do
        expect(find_or_create).to receive(:call)
        expect(subcategory_find_or_create).not_to receive(:call)
        
        subject.call
      end
    end
  end
end