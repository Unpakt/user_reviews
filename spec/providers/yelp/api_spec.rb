require 'spec_helper'

describe Providers::Yelp::Api do

  describe "#initialize" do
    it "initializes a new GoogleReviews provider" do
      Providers::Yelp::Api.new(consumer_key: "",
                                    consumer_secret: "",
                                    token: "",
                                    token_secret: "").should be
    end
  end

  describe "#find_business_by_name" do
    let(:token) { stub }
    let(:api_result) { stub }
    let(:response_body) { stub }
    let(:business_path) { "super_path" }
    let(:business_place) do
      {"location" => {"display_address" => ["1 Place", "NY"]}}
    end
    let(:json_result) {{"businesses" => business_places }}
    let(:business_places) { [business_place] }
    let(:yelp_wrapper) { Providers::Yelp::Api.new({}) }
    let(:query_result) { [Providers::Yelp::Business.build_business(business_place)] }

    it "returns an array of possible businesses" do
      yelp_wrapper.should_receive(:create_oauth_token) { token }
      yelp_wrapper.should_receive(:business_path).with("Unpakt", "movers", "NY,NY") { business_path }
      token.should_receive(:get).with(business_path) { api_result }
      api_result.should_receive(:body) { response_body }


      JSON.should_receive(:parse).with(response_body) { json_result }
      yelp_wrapper.should_receive(:parse_businesses).with(business_places) { query_result }

      yelp_wrapper.find_business_by_name("Unpakt", "movers", "NY,NY").should eq query_result
    end
  end


  describe "#find_reviews_for_business" do
    let(:token) { stub }
    let(:api_result) { stub }
    let(:response_body) { stub }
    let(:review_path) { "super_path" }
    let(:review) {{"rating" => 1}}
    let(:reviews) { [review] }
    let(:json_result) {{"reviews" => reviews }}
    let(:yelp_wrapper) { Providers::Yelp::Api.new({}) }
    let(:query_result) { [Providers::Yelp::Review.new(review)] }

    it "returns an array of possible businesses" do
      yelp_wrapper.should_receive(:create_oauth_token) { token }
      yelp_wrapper.should_receive(:review_path).with("yelp-Unpakt") { review_path }
      token.should_receive(:get).with(review_path) { api_result }
      api_result.should_receive(:body) { response_body }


      JSON.should_receive(:parse).with(response_body) { json_result }
      yelp_wrapper.should_receive(:parse_reviews).with(reviews) { query_result }

      yelp_wrapper.find_reviews_for_business("yelp-Unpakt").should eq query_result
    end
  end
end
