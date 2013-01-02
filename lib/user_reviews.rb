require "user_reviews/version"
require 'providers/yelp_reviews/business'
require 'providers/yelp_reviews/review'
require 'providers/google_reviews/business'
require 'providers/google_reviews/review'
require 'providers/citysearch_reviews/business'
require 'providers/citysearch_reviews/review'
require "providers/citysearch_reviews_api"
require "providers/google_reviews_api"
require "providers/yelp_reviews_api"

module UserReviews
  class ApiProvider
    def self.get_api_provider(service, init_options)
      case service
      when :yelp
        Providers::YelpReviewsApi.new(init_options)
      when :citysearch
        Providers::CitysearchReviewsApi.new(init_options)
      when :google
        Providers::GoogleReviewsApi.new(init_options)
      end
    end
  end
end
