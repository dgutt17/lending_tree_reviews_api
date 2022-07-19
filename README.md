# Lending Tree Review Service <br />

## Introduction <br />
This service takes a url from a request and responds with an array of all the reviews associated with that url from lendingtree.com. We make an API request to this url `https://www.lendingtree.com/wp-json/review/proxy` to retrieve the data. The request requires two pieces of dynamic data: 1) the `brand_id` and 2) the `nonce`. 

The `brand_id` must be retrieved per business. We either parse the `brand_id` from the businesses review page or we return it from Postgres. We are caching the `brand_id` to avoid having to scrape for it everytime the business is called.

The `nonce` is an alphanumeric that is required in the `X-WP-Nonce` header of the API call. This changes everyday and we grab it from the main lendingtree reviews page. A script was written to grab the nonce and it will act as a Cron Job called everyday. We store the nonce in redis.

## The API Specifications<br />
    1. Request Type: GET
    2. Route: ROOT/fetch_reviews_by_business_url/?url=url_for_a_review_page
    3. url parameter
      a. REQUIREMENTS
        1. The url must contain: `lendingtree.com/reviews/business/business_name/business_id`.
        2. Business Name is an alpanumeric that can also have dashes.
        3. Business Id must have be an integer.
      b. If any of the requirements fail, you will receive a 400.

## Example Request<br />
```
[ROOT]/fetch_reviews_by_business_url/?url=https://www.lendingtree.com/reviews/business/quickbridge/73465606
```

## Example Response Body<br />

```
{
  [
    {
        "title": "Expedited Approval and Payment Process",
        "star_rating": "4",
        "text": "Expedited the approval and payment process allowing me to acquire funding pretty much immediately when I was ready.",
        "author": "Tim",
        "date_of_review": "2022-07-15"
    },
  ]
}
```

## API Tech Stack<br />
1. Ruby 2.7.4<br />
2. Sinatra 2.2.0<br />
3. PostgreSQL 13.4<br />
5. Redis 7.0.0<br />
6. RSpec 3.11.0<br />
7. Nokogiri 1.13.6<br />