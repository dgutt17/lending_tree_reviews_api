require 'spec_helper'

RSpec.describe LendingTree::NonceGetter, type: :lib do
  let(:html) { File.read('spec/fixtures/businesses_page.html') }

  it 'has the correct value for the LENDING_TREE_BUSINESS_REVIEWS_URL constant' do 
    expect(LendingTree::NonceGetter::LENDING_TREE_BUSINESS_REVIEWS_URL).to eq('https://www.lendingtree.com/reviews/business')
  end

  it 'has the correct value for the NONCE_ID_CSS constant' do 
    expect(LendingTree::NonceGetter::NONCE_ID_CSS).to eq('#jquery-core-js-extra')
  end

  it 'has the correct value for the NONCE constant' do 
    expect(LendingTree::NonceGetter::NONCE).to eq('nonce')
  end

  it 'grabs the correct nonce value from the businesses page' do 
    nonce_getter = LendingTree::NonceGetter.new
    allow(nonce_getter).to receive(:document) { Nokogiri::HTML(html) }
    # We test this private method to avoid dealing with redis and to ensure the correct nonce is received.
    nonce_object = nonce_getter.send(:nonce_object)

    expect(nonce_object['nonce']).to eq('14e5d0c153')
  end
end