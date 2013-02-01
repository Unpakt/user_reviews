# UserReviews

Is a simple api wrapper for:

* Yelp
* City Search
* Google Ratings

## Getting started

### Add this line to your application's Gemfile:

```ruby
gem 'user_reviews'
```

### And then execute:

```console
$ bundle
```

### Or install it yourself as:

```console
$ gem install user_reviews
```

## Usage

### Create an api_provider

### For city search

```ruby
auth_info = {publisher_key: 'your_city_search_api_key'}
api_provider = UserReviews::ApiProvider.get_api_provider(:city_search, auth_info)
```

### For Google Reviews

```ruby
auth_info = {key: 'your_google_api_key'}
api_provider = UserReviews::ApiProvider.get_api_provider(:google_reviews, auth_info)
```

### For Yelp

```ruby
auth_info = {consumer_key: 'yelp_consumer_key', consumer_secret:'yelp_consumer_secret' ,token:'yelp_token' , token_secret:'yelp_token_secret'}
api_provider = UserReviews::ApiProvider.get_api_provider(:yelp, auth_info)
```

### Get reviews for a business

```ruby
api_provider.find_reviews_for_business city_search_business_id
```

### Get information about a business

```ruby
api_provider.find_business_by_id(business_id)
```

### Google Reviews only

```ruby
api_provider.find_business_by_name
```


Each Review object has 4 attributes:
* author_name
* rating
* reviewed_at
* comment

Each Business object has 4 attributes:
* name
* address
* reference
* average_rating
* url


More information about each API:

* [Yelp]: http://www.yelp.com/developers/documentation/v2/overview
* CitySearch: http://www.citygridmedia.com/developer/
* GoogleReviews: https://developers.google.com/places/documentation/


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License. Copyright 2013. http://www.unpakt.com
