# -*- encoding: utf-8 -*-
# stub: touch_action 1.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "touch_action".freeze
  s.version = "1.3.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ricardo Nacif".freeze]
  s.date = "2015-08-24"
  s.description = "Adds touch gestures simulation to Watir, Selenium and Capybara using YUI JS.".freeze
  s.email = ["nacif.ricardo@gmail.com".freeze]
  s.homepage = "https://github.com/Ricardonacif/touch_action".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.4.5".freeze
  s.summary = "Adds touch gestures simulation to Watir-WebDriver, Selenium-WebDriver and Capybara using YUI JS.".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<watir-webdriver>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<capybara>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0".freeze])
  s.add_development_dependency(%q<pry>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rack>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1.0".freeze])
  s.add_development_dependency(%q<thin>.freeze, [">= 0".freeze])
end
