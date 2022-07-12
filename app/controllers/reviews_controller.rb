require 'uri'
require './lib/brand_id_getter.rb'
require './lib/lending_tree_api_wrapper.rb'
class ReviewsController < ApplicationController
  get '/fetch_reviews_by_business_url/' do 
    set_brand_id
    @response = lending_tree_api_wrapper.run
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

  def get_brand_id_from_html
    BrandIdGetter.new(params['url']).run
  end

  def set_brand_id
    if business.nil?
      @brand_id = get_brand_id_from_html
      cache_brand_id
    else
      @brand_id = business.brand_id
    end
  end

  def lending_tree_api_wrapper
    LendingTreeApiWrapper.new(@brand_id)
  end

  def cache_brand_id
    Business.create!(name: business_name, brand_id: @brand_id)
  end
end