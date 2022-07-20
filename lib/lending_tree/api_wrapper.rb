module LendingTree
  class ApiWrapper < Base
    attr_reader :url, :brand_id

    def initialize(brand_id)
      @brand_id = brand_id
      @url = create_url(@brand_id)
    end

    def call
      response = http_request
      app_logger.info("Made an API request with this brand_id: #{brand_id}")
      raise_api_wrapper_error(response) if response.code != 200

      response
    end

    private

    def create_url(brand_id)
      "https://www.lendingtree.com/wp-json/review/proxy?RequestType=&productType=&brandId=#{brand_id}&requestmode=reviews,stats,ratingconfig,propertyconfig&page=0&sortby=reviewsubmitted&sortorder=desc&pagesize=#{ENV['PAGE_SIZE']}"
    end

    def nonce
      @nonce ||= redis.get(NONCE)
    end

    def http_request
      HTTParty.get(url, :headers => headers)
    end

    def headers
      @headers ||= {'X-WP-Nonce': nonce}
    end

    def redis
      @redis ||= Redis.new
    end

    def raise_api_wrapper_error(response)
      raise Exceptions::ApiWrapperError.new(response.message, response.code)
    end

  end
end