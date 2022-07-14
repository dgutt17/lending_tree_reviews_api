class BusinessNameGetter
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    name_and_id = url.split('/reviews/business/').last
    name = name_and_id.split('/').first

    name
  end
end