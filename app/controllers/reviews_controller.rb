class ReviewsController < ApplicationController
  get '/fetch_reviews_by_business_url/' do 
    set_brand_id
    response = lending_tree_api_wrapper.call

    parse_reviews(response)
  end

  private 

  def set_brand_id
    if business.nil?
      @brand_id = get_brand_id_from_html
      cache_brand_id
    else
      @brand_id = business.brand_id
    end
  end

  def business
    @business ||= Business.find_by(name: business_name_from_url)
  end

  def business_name_from_url
    @business_name_from_url ||= BusinessNameGetter.call(params['url'])
  end

  def get_brand_id_from_html
    LendingTree::BrandIdGetter.new(params['url']).call
  end

  def cache_brand_id
    Business.create!(name: business_name_from_url, brand_id: @brand_id)
  end

  def lending_tree_api_wrapper
    LendingTree::ApiWrapper.new(@brand_id)
  end

  def parse_reviews(response)
    ReviewsParser.call(response)
  end
end