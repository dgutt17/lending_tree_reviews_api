require 'spec_helper'

RSpec.describe LendingTree::ApiWrapper, type: :lib do
  let(:response_json) { File.read('spec/fixtures/api_response.json') }
  let(:response) {OpenStruct.new(code: 200, body: response_json)}

  it 'should return a json string' do 
    api_wrapper = LendingTree::ApiWrapper.new('123456abc')
    allow(api_wrapper).to receive(:nonce) { '57rytyf8' }
    allow(api_wrapper).to receive(:http_request) { response }

    test_response = api_wrapper.call
    expect(test_response.body.class).to eq(String)
  end

  it 'has the correct value for the NONCE constant' do 
    expect(LendingTree::ApiWrapper::NONCE).to eq('nonce')
  end
end