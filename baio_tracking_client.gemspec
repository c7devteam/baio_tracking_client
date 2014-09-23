# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baio_tracking_client/version'

Gem::Specification.new do |spec|
  spec.name          = "baio_tracking_client"
  spec.version       = BaioTrackingClient::VERSION
  spec.authors       = ["DainisL"]
  spec.email         = ["dainis186@gmail.com"]
  spec.summary       = %q{Client for baip traking system}
  spec.description   = %q{Client for baip traking system}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'simplecov', '~> 0.9.0'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'
  spec.add_development_dependency 'webmock', '~> 1.18.0'
  spec.add_development_dependency 'vcr', '~> 2.9.2'

  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'typhoeus', '~> 0.6.9'
  spec.add_dependency 'faraday_middleware', '~> 0.9.1'
end