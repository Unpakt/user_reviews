require 'spec_helper'

describe Providers::CitysearchReviews::Business do
  describe "#initialize" do
    let(:address) { {"street" => '', "city" => '', "state" => '', "postal_code" => '' } }
    let(:node) do
      {
        "name" => '',
        "address" => address,
        "id" => stub,
        "rating" => stub,
        "review_info" => {}
      }
    end

    context "when required fields are not present" do
      let(:node) { Hash.new(nil) }
      it "returns nil" do
        biz = Providers::CitysearchReviews::Business.build_business(node)
        biz.should be_nil
      end
    end

    context "when required fields are present" do
      it "returns an Bussiness object" do
        Providers::CitysearchReviews::Business.build_business(node).should be
      end
    end

  end
end
