require 'spec_helper'

describe Providers::Citysearch::Business do
  describe "#initialize" do
    let(:address) { {"street" => '', "city" => '', "state" => '', "postal_code" => '' } }

    context "when required fields are not present" do
      let(:node) do
        {
          "name" => '',
          "address" => address,
          "id" => stub,
          "rating" => stub,
          "review_info" => {}
        }
      end

      it "returns nil" do
        biz = Providers::Citysearch::Business.build_business(node)
        biz.should be_nil
      end
    end

    context "when required fields are present" do
      let(:node) do
        {
          "name" => '',
          "address" => address,
          "id" => stub,
          "rating" => stub,
          "user_review_count" => stub,
          "profile" => stub
        }
      end

      it "returns an Bussiness object" do
        Providers::Citysearch::Business.build_business(node).should be
      end
    end

  end
end
