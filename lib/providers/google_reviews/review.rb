module Providers
  module GoogleReviews
    class Review
      attr_accessor :rating, :author_name, :reviewed_at, :comment

      def initialize(node)
        @rating = average_rating(node["aspects"])
        @author_name = node["author_name"]
        @reviewed_at = Time.at(node["time"].to_i)
        @comment = node["text"]
      end

      private

      def average_rating(arr)
        return 0 if arr.nil? || arr.size < 1

        sum = 0
        arr.each { |el| sum += el["rating"].to_f }
        sum.to_f / arr.size
      end
    end
  end
end
