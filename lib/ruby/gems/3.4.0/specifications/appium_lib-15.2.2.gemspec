# -*- encoding: utf-8 -*-
# stub: appium_lib 15.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "appium_lib".freeze
  s.version = "15.2.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["code@bootstraponline.com".freeze, "Kazuaki Matsuo".freeze]
  s.date = "2024-08-06"
  s.description = "Ruby library for Appium.".freeze
  s.email = ["code@bootstraponline.com".freeze, "fly.49.89.over@gmail.com".freeze]
  s.homepage = "https://github.com/appium/ruby_lib".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.5.9".freeze
  s.summary = "Ruby library for Appium".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<appium_lib_core>.freeze, ["~> 9.2".freeze, ">= 9.2.1".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.8".freeze, ">= 1.8.1".freeze])
  s.add_runtime_dependency(%q<tomlrb>.freeze, [">= 1.1".freeze, "< 3.0".freeze])
  s.add_development_dependency(%q<appium_thor>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<fakefs>.freeze, ["~> 2.5.0".freeze])
  s.add_development_dependency(%q<hashdiff>.freeze, ["~> 1.1.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
  s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1.1".freeze])
  s.add_development_dependency(%q<pry>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["= 1.65.1".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.11".freeze])
end
