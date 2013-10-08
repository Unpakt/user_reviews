module Providers
  module Yelp
    class Business
      attr_accessor :name, :address, :yelp_id, :average_rating, :total_reviews, :url

      def self.build_business(node)
        new(node)
      end

      private

      def initialize(node)
        return if [node,
                  node["location"],
                  node["location"]["display_address"],
                  node["rating"],
                  node["url"],
                  node["review_count"],
                  node["id"]].include?(nil)

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
