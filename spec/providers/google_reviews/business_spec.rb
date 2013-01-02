require 'spec_helper'

describe Providers::GoogleReviews::Business do
  describe "#initialize" do
    let(:node) do
      {
        "name" => '',
        "formatted_address" => '',
        "reference" => stub,
        "url" => stub,
        "rating" => stub
      }
    end

    context "when required fields are not present" do
      let(:node) { Hash.new(nil) }
      it "returns nil" do
        biz = Providers::GoogleReviews::Business.build_business(node)
        biz.should be_nil
      end
    end

    context "when required fields are present" do
      it "returns an Bussiness object" do
        Providers::GoogleReviews::Business.build_business(node).should be
      end
    end

  end
end
