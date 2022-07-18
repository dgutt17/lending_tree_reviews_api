class ReviewsController < ApplicationController
  set :raise_errors, false
  set :show_exceptions, false

  get '/fetch_reviews_by_business_url/' do 
    if valid_url_param
      set_brand_id
      response = lending_tree_api_wrapper.call

      parse_reviews(response)
    else
      error 400, @error_message
    end
  end

  private 

  def valid_url_param  
    url = params['url']
    if !url.include?('lendingtree.com/reviews/business')
      @error_message = 'Incorrect Base url in url param'
      return false
    end

    name_and_id = url.split('/reviews/business/').last
    name = name_and_id.first
    id = name_and_id.last

    if name !~ /^[a-zA-Z0-9\-]+$/
      @error_message = 'Incorrectly formatted business name'
      return false
    end

    if id !~ /\A\d+\Z/
      @error_message = 'Business Id not present or not an integer'
      return false
    end

    true
  end

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
    @business_name_from_url ||= begin
      name_and_id = params['url'].split('/reviews/business/').last
      name = name_and_id.split('/').first

      name
    end
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
    ReviewsParser.new(response).call
  end
end