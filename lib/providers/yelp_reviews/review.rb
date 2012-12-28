module Providers
  module YelpReviews
    class Review
      attr_accessor :rating, :author_name, :reviewed_at, :comment

      def initialize(node)
        @rating = node["rating"]
        @author_name = node["name"]
        @reviewed_at = Time.at(node["time_created"].to_i)
        @comment = node["excerpt"]
      end
    end
  end
end
