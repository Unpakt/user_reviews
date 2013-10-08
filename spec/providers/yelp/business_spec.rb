require 'spec_helper'

describe Providers::Yelp::Business do
  describe "#initialize" do
    context "when required fields are not present" do
      let(:node) do
        {
          "location" => {},
          "rating" => '',
          "id" => stub,
        }
      end

      it "returns nil" do
        biz = Providers::Yelp::Business.build_business(node)
        biz.should be_nil
      end
    end

    context "when required fields are present" do
      let(:node) do
        {
          "location" => { "display_address" => ["City", "Zip"] },
          "rating" => stub,
          "name" => stub,
          "url" => stub,
          "review_count" => stub,
          "id" => stub,
        }
      end

      it "returns an Bussiness object" do
        Providers::Yelp::Business.build_business(node).should be
      end
    end

  end
end
