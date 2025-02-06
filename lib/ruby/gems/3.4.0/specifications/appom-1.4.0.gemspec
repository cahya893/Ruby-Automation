# -*- encoding: utf-8 -*-
# stub: appom 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "appom".freeze
  s.version = "1.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Harry.Tran".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-08-14"
  s.description = "Appom gives you a simple, clean and semantic for describing your application. Appom implements the Page Object Model pattern on top of Appium.".freeze
  s.email = ["hoang@platphormcorp.com".freeze]
  s.homepage = "https://github.com/hoangtaiki/appom".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.3".freeze)
  s.rubygems_version = "3.2.19".freeze
  s.summary = "A Page Object Model for Appium".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<appium_lib>.freeze, [">= 9.4".freeze])
  s.add_runtime_dependency(%q<cucumber>.freeze, [">= 2.3".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0.58".freeze])
end
