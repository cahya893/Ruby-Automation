# -*- encoding: utf-8 -*-
# stub: selenium-cucumber 3.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "selenium-cucumber".freeze
  s.version = "3.1.5".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sameer Sawant".freeze]
  s.date = "2016-09-12"
  s.description = "Behavior driven development (BDD) approach to write automation test script to test Web and Android applications.".freeze
  s.email = "sameersawant222@gmail.com".freeze
  s.executables = ["generate.rb".freeze, "helper.rb".freeze, "selenium-cucumber".freeze]
  s.files = ["bin/generate.rb".freeze, "bin/helper.rb".freeze, "bin/selenium-cucumber".freeze]
  s.homepage = "http://seleniumcucumber.info/".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "Thank you for installing selenium-cucumber gem.".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.4.8".freeze
  s.summary = "SELENIUM WEBDRIVER WITH RUBY & CUCUMBER".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<cucumber>.freeze, [">= 2.3.0".freeze])
  s.add_runtime_dependency(%q<selenium-webdriver>.freeze, [">= 2.53.0".freeze])
  s.add_runtime_dependency(%q<chunky_png>.freeze, [">= 1.3.5".freeze])
  s.add_runtime_dependency(%q<appium_lib>.freeze, [">= 8.0.2".freeze])
  s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.4.0".freeze])
  s.add_development_dependency(%q<pry>.freeze, [">= 0".freeze])
end
