require 'httparty'
require 'oauth'
require 'json'
require 'open-uri'
require 'date'

module Providers
  class Base

    def find_business_by_name(name, business_type, city_state = "")
    end

    def find_reviews_for_business(ref)
    end

    def find_business_by_id(id)
    end

  end
end
