require 'spec_helper'

describe Providers::Google::Business do
  describe "#initialize" do
    let(:node) do
      {
        "name" => '',
        "formatted_address" => '',
        "reference" => stub,
        "url" => stub,
        "rating" => stub,
        "user_ratings_total" => stub
      }
    end

    context "when required fields are not present" do
      let(:node) { Hash.new(nil) }
      it "returns nil" do
        biz = Providers::Google::Business.build_business(node)
        biz.should be_nil
      end
    end

    context "when required fields are present" do
      it "returns an Bussiness object" do
        Providers::Google::Business.build_business(node).should be
      end
    end

  end
end
