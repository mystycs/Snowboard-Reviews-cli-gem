# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snowboard_reviews/version'

Gem::Specification.new do |spec|
  spec.name          = 'snowboard_reviews'
  spec.version       = SnowboardReviews::VERSION
  spec.authors       = ['mystycs']
  spec.email         = ['mystycs@gmail.com']

  spec.summary       = 'This gem will scrape thegoodride.com and get a list of all the snowboards for male and female via JSON, and then allow the user to select and read a review of a snowboard of the users choice.'
  #spec.description   = 'TODO: Write a longer description or delete this line.'
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  #spec.add_development_dependency 'pry'

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'json'
  spec.add_dependency 'colorize'
end
