require 'spec_helper'

describe Providers::YelpReviews::Business do
  describe "#initialize" do
    let(:node) do
      {
        "location" => '',
        "rating" => '',
        "id" => stub,
      }
    end

    context "when required fields are not present" do
      let(:node) { Hash.new(nil) }
      it "returns nil" do
        biz = Providers::YelpReviews::Business.build_business(node)
        biz.should be_nil
      end
    end

    context "when required fields are present" do
      it "returns an Bussiness object" do
        Providers::YelpReviews::Business.build_business(node).should be
      end
    end

  end
end
