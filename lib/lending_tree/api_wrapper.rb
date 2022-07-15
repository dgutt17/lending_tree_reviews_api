module LendingTree
  class ApiWrapper < Base
    attr_reader :url

    def initialize(brand_id)
      @url = create_url(brand_id)
    end

    def call
      response = http_request

      response
    end

    private

    def create_url(brand_id)
      "https://www.lendingtree.com/wp-json/review/proxy?RequestType=&productType=&brandId=#{brand_id}&requestmode=reviews,stats,ratingconfig,propertyconfig&page=0&sortby=reviewsubmitted&sortorder=desc&pagesize=1000"
    end

    def nonce
      @nonce ||= redis.get(NONCE_KEY)
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
  end
end