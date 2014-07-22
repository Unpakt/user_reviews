module Providers
  module Google
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :url, :total_number_of_ratings

      def self.build_business(node)
        return nil if [node["name"], node["formatted_address"], node["reference"]].include?(nil)
        new(node)
      end

      private
      def initialize(node)
        @name = node["name"]
        @address = node["formatted_address"]
        @reference = node["reference"]
        @average_rating = node["rating"]
        @total_number_of_ratings = node["user_ratings_total"]
        @url = node["url"]
      end
    end
  end
end
