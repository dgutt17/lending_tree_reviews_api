require 'spec_helper'

RSpec.describe LendingTree::NonceGetter, type: :lib do
  it 'has the correct value for the LENDING_TREE_BUSINESS_REVIEWS_URL constant' do 
    expect(LendingTree::NonceGetter::LENDING_TREE_BUSINESS_REVIEWS_URL).to eq('https://www.lendingtree.com/reviews/business')
  end

  it 'has the correct value for the NONCE_ID_CSS constant' do 
    expect(LendingTree::NonceGetter::NONCE_ID_CSS).to eq('#jquery-core-js-extra')
  end

  it 'has the correct value for the NONCE_KEY constant' do 
    expect(LendingTree::NonceGetter::NONCE_KEY).to eq('nonce')
  end
end