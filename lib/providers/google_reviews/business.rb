module Providers
  module GoogleReviews
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :url

      def initialize(node)
        @name = node["name"]
        @address = node["formatted_address"]
        @reference = node["reference"]
        @average_rating = node["rating"]
        @url = node["url"]
      end
    end
  end
end
