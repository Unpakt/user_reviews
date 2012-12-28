require 'date'

module Providers
  module CitysearchReviews
    class Review
      attr_accessor :rating, :author_name, :reviewed_at, :comment

      def initialize(node)
        @rating = node["review_rating"]
        @author_name = node["review_author"]
        @reviewed_at = DateTime.parse(node["review_date"]).to_time
        @comment = node["review_text"]
      end
    end
  end
end
