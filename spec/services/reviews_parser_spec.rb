require 'spec_helper'

RSpec.describe ReviewsParser, type: :service do
  let(:response_json) { File.read('spec/fixtures/api_response.json') }
  let(:reviews) { ReviewsParser.new(response_json).call }

  before do 
    @parsed_reviews = JSON.parse(reviews)
  end

  it 'should return a string value' do 
    expect(reviews.class).to eq(String)
  end

  it 'should have three different reviews' do 
    expect(@parsed_reviews.length).to eq(3)
  end

  it 'should have a title key' do 
    @parsed_reviews.each do |review|
      expect(review).to have_key('title')
    end
  end

  it 'should have an author key' do 
    @parsed_reviews.each do |review|
      expect(review).to have_key('author')
    end
  end

  it 'should have a star_rating key' do 
    @parsed_reviews.each do |review|
      expect(review).to have_key('star_rating')
    end
  end

  it 'should have a date_of_review key' do 
    @parsed_reviews.each do |review|
      expect(review).to have_key('date_of_review')
    end
  end

  xit 'should have a text key' do 
    @parsed_reviews.each do |review|
      expect(review).to have_key('text')
    end
  end
end