# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'user_reviews/version'

Gem::Specification.new do |gem|
  gem.name          = "user_reviews"
  gem.version       = UserReviews::VERSION
  gem.authors       = ["Unpakt LLC"]
  gem.email         = ["info@unpakt.com"]
  gem.description   = %q{Wrapper for mulitple user review APIs}
  gem.summary       = %q{Wrapper for mulitple user review APIs}
  gem.homepage      = "http://www.unpakt.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "httparty"
  gem.add_development_dependency "oauth"
  gem.add_development_dependency "json"
end
