module Providers
  module GoogleReviews
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :url

      def self.build_business(node)
        return nil if [node["name"], node["formatted_address"], node["reference"], node["rating"],node["url"]].include?(nil)
        new(node)
      end

      private
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
