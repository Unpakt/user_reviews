module Providers
  module GoogleReviews
    class Business
      attr_accessor :name, :address, :reference, :average_rating

      def initialize(node)
        @name = node["name"]
        @address = node["formatted_address"]
        @reference = node["reference"]
        @average_rating = node["rating"]
      end
    end
  end
end
