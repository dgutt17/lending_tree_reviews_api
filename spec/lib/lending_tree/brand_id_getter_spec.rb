require 'spec_helper'

RSpec.describe LendingTree::BrandIdGetter, type: :lib do
  it 'has the correct value for the BRAND_ID_CSS constant' do 
    expect(LendingTree::BrandIdGetter::BRAND_ID_CSS).to eq('.writeReview button')
  end

  it 'has the correct value for the BRAND_ID_ATTRIBUTE_NAME constant' do 
    expect(LendingTree::BrandIdGetter::BRAND_ID_ATTRIBUTE_NAME).to eq('data-lenderreviewid')
  end
end