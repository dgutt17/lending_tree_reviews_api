require 'uri'
class ReviewsController < ApplicationController
  get '/fetch_reviews_by_business_url/' do 
    binding.pry
    set_brand_id
    @response = lending_tree_api_wrapper.run
    binding.pry
  end

  private 

  def business_name
    @business_name ||= begin
      name_and_id = params['url'].split('/reviews/business/').last
      name = name_and_id.split('/').first

      name
    end
  end

  def business
    @business ||= Business.find_by(name: business_name)
  end

  def get_brand_id
    BrandIdGetter.new(params['url'])
  end

  def set_brand_id
    if business.nil?
      @brand_id = get_brand_id
    else
      @brand_id = business.brand_id
    end
  end

  def lending_tree_api_wrapper
    LendingTreeApiWrapper.new(brand_id)
  end
end