# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gotransverse-tract-api/version'

Gem::Specification.new do |spec|
  spec.name          = "gotransverse-tract-api"
  spec.version       = GoTransverseTractApi::VERSION
  spec.authors       = ["Julien DeFrance"]
  spec.email         = ["jdefrance@smartzip.com"]
  spec.summary       = "A ruby gem allowing developers to integrate with GoTransverse's TRACT API."
  spec.description   = "TRACT is a billing engine edited by GoTransverse that supports various revenue models like one-time purchases, simple subscriptions, and more complex, usage-based models."
  spec.homepage      = "https://rubygems.org/gems/gotransverse-tract-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency 'httpclient'
  spec.add_runtime_dependency 'nokogiri'
end
