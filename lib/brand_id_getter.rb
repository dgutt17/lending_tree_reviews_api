require 'open-uri'

class BrandIdGetter
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def run 
    parse_brand_id
  end

  private

  def document
    @document ||= Nokogiri::HTML(URI.open(url))
  end

  def parse_brand_id 
    document.css(ENV['BRAND_ID_CSS']).first.attributes[ENV['BRAND_ID_ATTRIBUTE_NAME']].value
  end
end