module LendingTree
  class BrandIdGetter
    attr_reader :url, :brand_id_css, :brand_id_attribute_name

    def initialize(url)
      @url = url
      @brand_id_css = ENV['BRAND_ID_CSS']
      @brand_id_attribute_name = ENV['BRAND_ID_ATTRIBUTE_NAME']
    end

    def call 
      parse_brand_id
    end

    private

    def document
      @document ||= Nokogiri::HTML(URI.open(url))
    end

    def parse_brand_id 
      attributes = document.css(brand_id_css).first.attributes

      attributes[brand_id_attribute_name].value
    end
  end
end