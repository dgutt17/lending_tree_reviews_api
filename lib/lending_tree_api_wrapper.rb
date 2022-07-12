class LendingTreeApiWrapper
  attr_reader :url, :headers
  X_WP_NONCE = '5f4167b4b4'

  def initialize(brand_id)
    @url = create_url(brand_id)
    @headers = {'X-WP-Nonce': X_WP_NONCE}
  end

  def run
    response = HTTParty.get(url, :headers => headers)
  end

  private

  def create_url(brand_id)
    "https://www.lendingtree.com/wp-json/review/proxy?RequestType=&productType=&brandId=#{brand_id}&requestmode=reviews,stats,ratingconfig,propertyconfig&page=0&sortby=reviewsubmitted&sortorder=desc&pagesize=1000"
  end
end