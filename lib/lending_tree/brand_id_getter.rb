module LendingTree
  class BrandIdGetter < Base
    attr_reader :url, :brand_id_css, :brand_id_attribute_name

    BRAND_ID_CSS = '.writeReview button'
    BRAND_ID_ATTRIBUTE_NAME = 'data-lenderreviewid'

    def initialize(url)
      @url = url
    end

    def call 
      parsed_document = document.css(BRAND_ID_CSS)
      raise_no_brand_id_found_error if parsed_document.length == 0

      attributes = parsed_document.first.attributes

      attributes[BRAND_ID_ATTRIBUTE_NAME].value
    end

    private

    def document
      @document ||= Nokogiri::HTML(URI.open(url))
    end

    def raise_no_brand_id_found_error
      raise Exceptions::NoBrandIdFound.new(url)
    end
  end
end