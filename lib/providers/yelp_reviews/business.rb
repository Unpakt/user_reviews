module Providers
  module YelpReviews
    class Business
      attr_accessor :name, :address, :yelp_id, :average_rating

      def initialize(node)
        @address = node["location"]["display_address"].join(" ")
        @name = node["name"]
        @average_rating = node["rating"]
        @yelp_id = node["id"]
      end
    end
  end
end
