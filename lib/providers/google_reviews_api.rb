require 'httparty'
require 'open-uri'

module Providers
  class GoogleReviewsApi

    def initialize(options)
      @key = options[:key]
    end

    def find_business_by_name(name, business_type, city_state = "")
      request_url = business_url(name, business_type)
      json_results = HTTParty.get(request_url)
      parse_business_results(json_results)
    end

    def find_reviews_for_business(ref)
      request_url = reviews_url(ref)
      json_results = HTTParty.get(request_url)
      parse_reviews_results(json_results)
    end

    def find_business_by_id(google_id)
      request_url = reviews_url(google_id)
      json_results = HTTParty.get(request_url)
      return json_results if json_results.nil?

      json = json_results["result"]
      return json if json.nil?

      Providers::GoogleReviews::Business.new(json)
    end

    private

    def business_url(business_name, business_type)
      "https://maps.googleapis.com/maps/api/place/textsearch/json?key=#{@key}&query=#{URI::encode(business_name)}=&sensor=false&type=#{URI::encode(business_type)}"
    end

    def reviews_url(reference)
      "https://maps.googleapis.com/maps/api/place/details/json?key=#{@key}&reference=#{reference}&sensor=false"
    end

    def parse_business_results(json)
      result = []
      return result if json.nil? || json["results"].nil?

      json["results"].each do |e|
        result.push(Providers::GoogleReviews::Business.new(e))
      end

      result
    end

    def parse_reviews_results(json)
      result = []
      return result if json.nil? || json["result"].nil? || json["result"]["reviews"].nil?

      json["result"]["reviews"].each do |e|
        result.push(Providers::GoogleReviews::Review.new(e))
      end

      result
    end
  end
end
