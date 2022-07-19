class ReviewsParser
  attr_reader :response

  def initialize(response)
    @response = JSON.parse(response)
  end

  def call
    reviews.map { |review| parse_review(review) }.to_json
  end

  private

  def reviews
    @reviews ||= response['result']['reviews']
  end

  def parse_review(review)
    {
      title: review['title'],
      author: review['authorName'],
      star_rating: review['primaryRating']['value'],
      date_of_review: remove_date_time_stamp(review['submissionDateTime']),
      text: review['text']
    }
  end

  def remove_date_time_stamp(datetime)
    datetime.to_date.to_s
  end
end