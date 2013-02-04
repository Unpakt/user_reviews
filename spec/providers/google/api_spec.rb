require 'spec_helper'

describe Providers::Google::Api do

  describe "#initialize" do
    it "initializes a new GoogleReviews provider" do
      Providers::Google::Api.new(key: "").should be
    end
  end

  describe "#find_business_by_name" do
    let(:json_result) { "{}" }
    let(:business_url) { "http://www.example.com" }
    let(:google_wrapper) { Providers::Google::Api.new(key: "") }
    let(:query_result) { [Providers::Google::Business.build_business(json_result)] }

    context "when the api is valid" do
      it "returns an array of possible businesses" do
        google_wrapper.should_receive(:business_url).with("Unpakt", "moving_company") {  business_url }
        HTTParty.should_receive(:get).with(business_url) { json_result }
        google_wrapper.should_receive(:parse_business_results).with(json_result) { query_result }

        google_wrapper.find_business_by_name("Unpakt", "moving_company").should eq query_result
      end
    end

    context "when the api query limit is reached" do
      let(:json_result) { {'status' => 'OVER_QUERY_LIMIT'} }

       it "raises an error" do
         google_wrapper.should_receive(:business_url).with("Unpakt", "moving_company") {  business_url }
         HTTParty.should_receive(:get).with(business_url) { json_result }
         lambda { google_wrapper.find_business_by_name("Unpakt", "moving_company") }.should raise_error Providers::Google::ExceededQueryLimitError
       end
    end
  end

  describe "#find_reviews_for_business" do
    let(:reference) { stub }
    let(:json_result) { "{}" }
    let(:reviews_url) { "http://www.example.com" }
    let(:google_wrapper) { Providers::Google::Api.new(key: "") }
    let(:query_result) { [Providers::Google::Review.new(json_result)] }

    it "returns the rating for a given entity" do
      google_wrapper.should_receive(:reviews_url).with(reference) {  reviews_url }
      HTTParty.should_receive(:get).with(reviews_url) { json_result }
      google_wrapper.should_receive(:parse_reviews_results).with(json_result) { query_result }

      google_wrapper.find_reviews_for_business(reference).should eq query_result
    end
  end

end
