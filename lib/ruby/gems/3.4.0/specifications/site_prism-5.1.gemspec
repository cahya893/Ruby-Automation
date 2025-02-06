# -*- encoding: utf-8 -*-
# stub: site_prism 5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "site_prism".freeze
  s.version = "5.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 3.2.3".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/site-prism/site_prism/issues", "changelog_uri" => "https://github.com/site-prism/site_prism/blob/main/CHANGELOG.md", "source_code_uri" => "https://github.com/site-prism/site_prism" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Luke Hill".freeze]
  s.date = "2025-01-08"
  s.description = "SitePrism gives you a simple, clean and semantic DSL for describing your site. SitePrism implements the Page Object Model pattern on top of Capybara.".freeze
  s.email = ["lukehill_uk@hotmail.com".freeze]
  s.homepage = "https://github.com/site-prism/site_prism".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "A Page Object Model DSL for Capybara".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.8".freeze, ">= 2.8.4".freeze])
  s.add_runtime_dependency(%q<capybara>.freeze, ["~> 3.34".freeze])
  s.add_runtime_dependency(%q<site_prism-all_there>.freeze, ["> 3".freeze, "< 5".freeze])
  s.add_development_dependency(%q<automation_helpers>.freeze, ["~> 5.0".freeze])
  s.add_development_dependency(%q<cucumber>.freeze, ["> 7".freeze, "< 10".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.13".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.69.0".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.23.0".freeze])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 3.3.0".freeze])
  s.add_development_dependency(%q<selenium-webdriver>.freeze, ["~> 4.7".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21".freeze])
  s.add_development_dependency(%q<webdrivers>.freeze, ["~> 5.3".freeze])
end
