module LendingTree
  class NonceGetter < Base
    attr_reader :redis

    LENDING_TREE_BUSINESS_REVIEWS_URL = 'https://www.lendingtree.com/reviews/business'
    NONCE_ID_CSS = '#jquery-core-js-extra'

    def initialize
      @redis = Redis.new
    end

    def call
      redis.set(NONCE, nonce_object[NONCE])

      redis.close
    rescue => e
      error_logger.debug((["error class: #{e.class}, error message: #{e.message}"]+e.backtrace).join($/))
    end

    private

    def document
      @document ||= Nokogiri::HTML(URI.open(LENDING_TREE_BUSINESS_REVIEWS_URL))
    end

    def nonce_object
      @nonce_object ||= begin
        hash = nil
        document.css(NONCE_ID_CSS).first.children.first.to_s.split.each do |char| 
          hash = JSON.parse(char[0..char.length - 2]) if char.include?(NONCE)
        end

        hash
      end
    end
  end
end