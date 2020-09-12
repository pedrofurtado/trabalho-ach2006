# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-fullcalendar/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-fullcalendar"
  spec.version       = RailsAssetsFullcalendar::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "Full-sized drag & drop event calendar"
  spec.summary       = "Full-sized drag & drop event calendar"
  spec.homepage      = "https://fullcalendar.io/"
  spec.license       = "MIT"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails-assets-jquery", ">= 2", "< 4"
  spec.add_dependency "rails-assets-moment", ">= 2.9.0", "< 3"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
