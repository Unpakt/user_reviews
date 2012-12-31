require 'httparty'
require 'open-uri'


module Providers
  class CitysearchReviewsApi
    LOCALHOST_IP = "127.0.0.1"
    def initialize(options)
      @key = options[:publisher_key]
      @ip = options[:client_ip] || LOCALHOST_IP
    end

    def find_business_by_name(name, business_type, city_state)
      request_url = business_search_url(name, business_type, city_state)
      json_results = HTTParty.get(request_url)
      parse_business_results(json_results)
    end

    def find_business_by_id(citysearch_id)
      request_url = business_url(citysearch_id)
      json_results = HTTParty.get(request_url)
      parse_business_results(json_results).first
    end

    def find_reviews_for_business(citysearch_id)
      request_url = reviews_url(citysearch_id)
      json_results = HTTParty.get(request_url)
      parse_reviews_results(json_results)
    end

    private

    def business_url(citysearch_id)
      "http://api.citygridmedia.com/content/places/v2/detail?publisher=#{@key}&id=#{citysearch_id}&id_type=cs&client_ip=127.0.0.1"
    end

    def business_search_url(name, business_type = "", city_state)
      "http://api.citygridmedia.com/content/places/v2/search/where?where=#{URI::encode(city_state)}&what=#{URI::encode(name)}&publisher=#{@key}&format=json"
    end

    def reviews_url(citysearch_id)
      "http://api.citygridmedia.com/content/reviews/v2/search/where?listing_id=#{citysearch_id}&publisher=#{@key}&format=json"
    end

    def parse_business_results(json)
      result = []
      return result if json.nil? || json["results"].nil?

      json = json["results"] || []
      json["locations"].each do |e|
        result.push(Providers::CitysearchReviews::Business.new(e))
      end

      result
    end

    def parse_reviews_results(json)
      result = []
      return result if json.nil? || json["results"].nil?

      json = json["results"] || []
      json["reviews"].each do |e|
        result.push(Providers::CitysearchReviews::Review.new(e))
      end

      result
    end
  end
end
