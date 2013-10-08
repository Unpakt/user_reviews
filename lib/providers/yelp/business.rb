module Providers
  module Yelp
    class Business
      attr_accessor :name, :address, :yelp_id, :average_rating, :total_reviews, :url

      def self.build_business(node)
        return nil if node.nil? ||
                      node["location"].nil? ||
                      node["location"].empty? ||
                      node["location"]["display_address"].nil? ||
                      node["rating"].nil? ||
                      node["url"].nil? ||
                      node["name"].nil? ||
                      node["review_count"].nil? ||
                      node["id"].nil?

        new(node)
      end

      private

      def initialize(node)
        @address = node["location"]["display_address"].join(" ")
        @name = node["name"]
        @average_rating = node["rating"]
        @total_reviews = node["review_count"]
        @yelp_id = node["id"]
        @url = node["url"]
      end
    end
  end
end
