module Providers
  module CitysearchReviews
    class Business
      attr_accessor :name, :address, :reference

      def initialize(node)
        @name = node["name"]
        full_address = node["address"]
        @address = [full_address["street"], full_address["city"], full_address["state"], full_address["postal_code"]].join(" ")
        @reference = node["id"]
      end
    end
  end
end
