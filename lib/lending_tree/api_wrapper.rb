require 'redis'

module LendingTree
  class ApiWrapper
    attr_reader :url, :headers

    NONCE_KEY = 'nonce'

    def initialize(brand_id)
      @url = create_url(brand_id)
      @headers = {'X-WP-Nonce': nonce}
    end

    def run
      response = HTTParty.get(url, :headers => headers)
    end

    private

    def create_url(brand_id)
      "https://www.lendingtree.com/wp-json/review/proxy?RequestType=&productType=&brandId=#{brand_id}&requestmode=reviews,stats,ratingconfig,propertyconfig&page=0&sortby=reviewsubmitted&sortorder=desc&pagesize=1000"
    end

    def nonce
      @nonce ||= redis.get(NONCE_KEY)
    end

    def redis
      @redis ||= Redis.new
    end
  end
end