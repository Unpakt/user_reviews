require 'spec_helper'

describe UserReviews do
  describe "::provider_factory" do
    context "when the provider exists" do
      it "returns a new Yelp api provider object" do
        UserReviews.provider_factory(:yelp, {}).should be_an_instance_of Providers::Yelp::Api
      end

      it "returns a new google api provider object" do
        UserReviews.provider_factory(:google, {}).should be_an_instance_of Providers::Google::Api
      end

      it "returns a new citysearch api provider object" do
        UserReviews.provider_factory(:citysearch, {}).should be_an_instance_of Providers::Citysearch::Api
      end
    end

    context "when the :not_found provider doesn't exist" do
      it "raises a provider not found error" do
        lambda {UserReviews.provider_factory(:foobar, {}) }.should raise_error UserReviews::ProviderNotFoundError
      end
    end

  end
end
