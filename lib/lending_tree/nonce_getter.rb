require 'open-uri'
require 'nokogiri'
require 'redis'

module LendingTree
  class NonceGetter
    attr_reader :redis

    LENDING_TREE_BUSINESS_REVIEWS_URL = 'https://www.lendingtree.com/reviews/business'
    NONCE_ID_CSS = '#jquery-core-js-extra'
    NONCE_KEY = 'nonce'

    def initialize
      @redis = Redis.new
    end

    def call
      hash = nil
      document.css(NONCE_ID_CSS).first.children.first.to_s.split().each do |char| 
        hash = JSON.parse(char[0..char.length - 2]) if char.include?('nonce')
      end

      redis.set(NONCE_KEY, hash['nonce'])

      redis.close
    end

    private

    def document
      @document ||= Nokogiri::HTML(URI.open(LENDING_TREE_BUSINESS_REVIEWS_URL))
    end
  end
end