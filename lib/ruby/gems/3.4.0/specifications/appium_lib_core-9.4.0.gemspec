# -*- encoding: utf-8 -*-
# stub: appium_lib_core 9.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "appium_lib_core".freeze
  s.version = "9.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kazuaki MATSUO".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-01-08"
  s.description = "Minimal Ruby library for Appium.".freeze
  s.email = ["fly.49.89.over@gmail.com".freeze]
  s.homepage = "https://github.com/appium/ruby_lib_core/".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.5.9".freeze
  s.summary = "Minimal Ruby library for Appium.".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faye-websocket>.freeze, ["~> 0.11.0".freeze])
  s.add_runtime_dependency(%q<selenium-webdriver>.freeze, ["~> 4.21".freeze])
  s.add_development_dependency(%q<appium_thor>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
  s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1.1".freeze])
  s.add_development_dependency(%q<parallel_tests>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["= 1.69.2".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<steep>.freeze, ["~> 1.7.0".freeze])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.24.0".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.11".freeze])
end
