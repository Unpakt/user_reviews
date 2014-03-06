module Providers
  module Google
    class Review
      attr_accessor :rating, :author_name, :reviewed_at, :comment

      def initialize(node)
        @rating = node["rating"]
        @author_name = node["author_name"]
        @reviewed_at = Time.at(node["time"].to_i)
        @comment = node["text"]
      end
    end
  end
end
