require 'spec_helper'

RSpec.describe LendingTree::BrandIdGetter, type: :lib do
  let(:url) { "https://www.lendingtree.com/reviews/business/fundbox-inc/111943337" }
  let(:html) { File.read('spec/fixtures/reviews_page.html') }

  it 'has the correct value for the BRAND_ID_CSS constant' do 
    expect(LendingTree::BrandIdGetter::BRAND_ID_CSS).to eq('.writeReview button')
  end

  it 'has the correct value for the BRAND_ID_ATTRIBUTE_NAME constant' do 
    expect(LendingTree::BrandIdGetter::BRAND_ID_ATTRIBUTE_NAME).to eq('data-lenderreviewid')
  end

  it 'returns the correct brand_id value' do 
    brand_id_getter = LendingTree::BrandIdGetter.new(url)
    allow(brand_id_getter).to receive(:document) { Nokogiri::HTML(html) }

    expect(brand_id_getter.call).to eq('57195')
  end
end