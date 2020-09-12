# -*- encoding: utf-8 -*-
# stub: rails-assets-fullcalendar 3.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-assets-fullcalendar".freeze
  s.version = "3.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["rails-assets.org".freeze]
  s.date = "2017-11-14"
  s.description = "Full-sized drag & drop event calendar".freeze
  s.homepage = "https://fullcalendar.io/".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Full-sized drag & drop event calendar".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails-assets-jquery>.freeze, ["< 4", ">= 2"])
      s.add_runtime_dependency(%q<rails-assets-moment>.freeze, ["< 3", ">= 2.9.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails-assets-jquery>.freeze, ["< 4", ">= 2"])
      s.add_dependency(%q<rails-assets-moment>.freeze, ["< 3", ">= 2.9.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails-assets-jquery>.freeze, ["< 4", ">= 2"])
    s.add_dependency(%q<rails-assets-moment>.freeze, ["< 3", ">= 2.9.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
