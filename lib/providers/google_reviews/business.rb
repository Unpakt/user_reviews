module Providers
  module GoogleReviews
    class Business
      attr_accessor :name, :address, :reference, :average_rating, :id

      def initialize(node)
        @name = node["name"]
        @address = node["formatted_address"]
        @reference = node["reference"]
        @average_rating = node["rating"]
        node["url"] =~ /https?:\/\/plus.google.com\/(\d+)(\/.*)?/
        @id = $1
      end
    end
  end
end
