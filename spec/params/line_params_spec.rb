describe LineParams do
  let(:raw_params) do 
    ActionController::Parameters.new line: line_params
  end

  let(:session) do 
    ActionDispatch::Request::Session.new line: session_params
  end

  let(:line_params)    { { fake: :params } }
  let(:session_params) { { fake: :session } }

  describe '#cart_id' do 

  end
end