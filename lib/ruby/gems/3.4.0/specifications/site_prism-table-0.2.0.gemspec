# -*- encoding: utf-8 -*-
# stub: site_prism-table 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "site_prism-table".freeze
  s.version = "0.2.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andr\u00E9 Aizim Kelmanson".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-02-09"
  s.description = "Table scraping for SitePrism".freeze
  s.email = ["akelmanson@gmail.com".freeze]
  s.homepage = "https://github.com/investtools/site_prism-table".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.1".freeze
  s.summary = "Table scraping for SitePrism".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.13".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<selenium-webdriver>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<site_prism>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
end
