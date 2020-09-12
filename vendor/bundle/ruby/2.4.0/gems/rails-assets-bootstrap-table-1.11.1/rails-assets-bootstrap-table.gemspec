# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-bootstrap-table/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-bootstrap-table"
  spec.version       = RailsAssetsBootstrapTable::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "An extended Bootstrap table with radio, checkbox, sort, pagination, and other added features."
  spec.summary       = "An extended Bootstrap table with radio, checkbox, sort, pagination, and other added features."
  spec.homepage      = "https://github.com/wenzhixin/bootstrap-table"
  spec.license       = "MIT"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
