# Lending Tree Review Service <br />

## Introduction <br />
This service takes a url from a request and responds with an array of all the reviews associated with that url from lendingtree.com. We make an API request to this url `https://www.lendingtree.com/wp-json/review/proxy` to retrieve the data. The request requires to pieces of dynamic data: 1) the `brand_id` and 2) the `nonce`. 