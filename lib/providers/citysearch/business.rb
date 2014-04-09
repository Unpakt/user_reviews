module Providers
  module Citysearch
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :total_reviews, :url

      def self.build_business(node)
        return nil if node.nil? ||
                      node["id"].nil? ||
                      node["name"].nil? ||
                      node["address"].nil?

        new(node)
      end

      private

      def initialize(node)

        @name = node["name"]
        full_address = node["address"]
        @address = [full_address["street"], full_address["city"], full_address["state"], full_address["postal_code"]].join(" ")
        @reference = node["id"]
        @total_reviews = node["review_info"]["total_user_reviews"]
        @url = node["profile"]
        @average_rating = node["review_info"]["overall_review_rating"]
      end
    end
  end
end
