require "user_reviews/version"
require 'active_support/inflector'

Dir[File.dirname(__FILE__) + "/providers/**/*.rb"].each do |file|
  require "#{file}"
end

Dir[File.dirname(__FILE__) + "/providers/*.rb"].each do |file|
  require "#{file}"
end

module UserReviews
  class ProviderNotFoundError < StandardError; end

  include ActiveSupport::Inflector

  def self.provider_factory(service, init_options)
    service = service.to_s.classify

    begin
      "Providers::#{service}::Api".constantize.new(init_options)
    rescue => e
      raise ProviderNotFoundError.new(e)
    end
  end
end
