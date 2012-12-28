module Providers
  module GoogleReviews
    class Business
      attr_accessor :name, :address, :reference

      def initialize(node)
        @name = node["name"]
        @address = node["formatted_address"]
        @reference = node["reference"]
      end
    end
  end
end
