module Providers
  module Citysearch
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :total_reviews, :url

      def self.build_business(node)
        new(node)
      end

      private

      def initialize(node)
        return if [node,
                  node["name"],
                  node["address"],
                  node["user_review_count"],
                  node["profile"]].include?(nil)

        @name = node["name"]
        full_address = node["address"]
        @address = [full_address["street"], full_address["city"], full_address["state"], full_address["postal_code"]].join(" ")
        @reference = node["id"]
        @total_reviews = node["user_review_count"]
        @url = node["profile"]
        @average_rating = node["rating"]
      end
    end
  end
end
