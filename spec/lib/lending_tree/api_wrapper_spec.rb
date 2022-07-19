require 'spec_helper'

RSpec.describe LendingTree::ApiWrapper, type: :lib do
  let(:response_json) { File.read('spec/fixtures/api_response.json') }

  it 'should return a json string' do 
    api_wrapper = LendingTree::ApiWrapper.new('123456abc')
    allow(api_wrapper).to receive(:nonce) { '57rytyf8' }
    allow(api_wrapper).to receive(:http_request) { response_json }

    expect(api_wrapper.call.class).to eq(String)
  end

  it 'has the correct value for the NONCE constant' do 
    expect(LendingTree::ApiWrapper::NONCE).to eq('nonce')
  end
end