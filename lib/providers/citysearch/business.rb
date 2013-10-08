module Providers
  module Citysearch
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :total_reviews, :url

      def self.build_business(node)
        return nil if node.nil? ||
                      node["name"].nil? ||
                      node["address"].nil? ||
                      node["user_review_count"].nil? ||
                      node["id"].nil? ||
                      node["rating"].nil? ||
                      node["profile"].nil?

        new(node)
      end

      private

      def initialize(node)

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
