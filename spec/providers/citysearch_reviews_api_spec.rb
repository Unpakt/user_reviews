require 'spec_helper'

describe Providers::CitysearchReviewsApi do
  before do
  end

  describe "#initialize" do
    it "initializes a new CitySearch provider" do
      Providers::CitysearchReviewsApi.new(publisher_key: "").should be
    end
  end

  describe "#find_business_by_name" do
    let(:json_result) { { "address" => {} } }
    let(:business_url) { "http://www.example.com" }
    let(:citysearch_wrapper) { Providers::CitysearchReviewsApi.new(key: "") }
    let(:query_result) { [Providers::CitysearchReviews::Business.build_business(json_result)] }

    it "returns an array of possible businesses" do
      citysearch_wrapper.should_receive(:business_search_url).with("Unpakt", "moving company", "NY,NY") {  business_url }
      HTTParty.should_receive(:get).with(business_url) { json_result }
      citysearch_wrapper.should_receive(:parse_business_results).with(json_result) { query_result }

      citysearch_wrapper.find_business_by_name("Unpakt", "moving company", "NY,NY").should eq query_result
    end
  end


  describe "#find_reviews_for_business" do
    let(:citysearch_id) { stub }
    let(:json_result) { {"review_date" => "2007-03-07T21:53:41.000Z"} }
    let(:reviews_url) { "http://www.example.com" }
    let(:citysearch_wrapper) { Providers::CitysearchReviewsApi.new(key: "") }
    let(:query_result) { [Providers::CitysearchReviews::Review.new(json_result)] }

    it "returns the rating for a given entity" do
      citysearch_wrapper.should_receive(:reviews_url).with(citysearch_id) {  reviews_url }
      HTTParty.should_receive(:get).with(reviews_url) { json_result }
      citysearch_wrapper.should_receive(:parse_reviews_results).with(json_result) { query_result }

      citysearch_wrapper.find_reviews_for_business(citysearch_id).should eq query_result
    end
  end
end
