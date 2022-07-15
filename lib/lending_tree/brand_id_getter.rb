module LendingTree
  class BrandIdGetter < Base
    attr_reader :url, :brand_id_css, :brand_id_attribute_name

    BRAND_ID_CSS = '.writeReview button'
    BRAND_ID_ATTRIBUTE_NAME = 'data-lenderreviewid'

    def initialize(url)
      @url = url
    end

    def call 
      attributes = document.css(BRAND_ID_CSS).first.attributes

      attributes[BRAND_ID_ATTRIBUTE_NAME].value
    end

    private

    def document
      @document ||= Nokogiri::HTML(URI.open(url))
    end
  end
end