module Providers
  module Yelp
    class Api < Providers::Base

      def initialize(options)
        @consumer_key = options[:consumer_key]
        @consumer_secret = options[:consumer_secret]
        @token = options[:token]
        @token_secret = options[:token_secret]
      end

      def find_business_by_name(name, business_type, city_state)
        access_token = create_oauth_token
        response = JSON.parse(access_token.get(business_path(name, business_type, city_state)).body)
        parse_businesses(response["businesses"])
      end

      def find_reviews_for_business(yelp_id)
        access_token = create_oauth_token
        response = JSON.parse(access_token.get(review_path(yelp_id)).body)
        parse_reviews(response["reviews"])
      end

      def find_business_by_id(yelp_id)
        access_token = create_oauth_token
        response = JSON.parse(access_token.get(review_path(yelp_id)).body)
        Providers::Yelp::Business.build_business(response) if response &&
          response["location"] &&
          response["location"]["display_address"]

      end

      private

      def create_oauth_token
        consumer_key = @consumer_key
        consumer_secret = @consumer_secret
        token = @token
        token_secret = @token_secret

        consumer = OAuth::Consumer.new(consumer_key, consumer_secret, site: "http://api.yelp.com")
        OAuth::AccessToken.new(consumer, token, token_secret)
      end

      def business_path(name, business_type, city_state)
        "/v2/search?term=#{URI::encode(name)}&category_filter=#{URI::encode(business_type)}&location=#{URI::encode(city_state)}"
      end

      def review_path(yelp_id)
        "/v2/business/#{yelp_id}"
      end

      def parse_businesses(business_list)
        result = []
        return result if business_list.nil? || business_list.empty?

        business_list.each do |business|
          result.push(Providers::Yelp::Business.build_business(business))
        end

        result
      end

      def parse_reviews(review_list)
        result = []
        return result if review_list.nil?

        review_list.each do |review|
          result.push(Providers::Yelp::Review.new(review))
        end

        result
      end
    end
  end
end
