# -*- encoding: utf-8 -*-
# stub: site_prism-all_there 3.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "site_prism-all_there".freeze
  s.version = "3.0.6".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/site-prism/site_prism-all_there/issues", "changelog_uri" => "https://github.com/site-prism/site_prism-all_there/blob/main/CHANGELOG.md", "source_code_uri" => "https://github.com/site-prism/site_prism-all_there" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Luke Hill".freeze]
  s.date = "2024-12-20"
  s.description = "SitePrism AllThere allows you to recursively query page and section structures\non your page - exclusively for use with the SitePrism gem.".freeze
  s.email = ["lukehill_uk@hotmail.com".freeze]
  s.homepage = "https://github.com/site-prism/site_prism-all_there".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "A SitePrism extension that allows you to recurse through your SitePrism Pages or Sections".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.13".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.69.0".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.23.0".freeze])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 3.2.0".freeze])
  s.add_development_dependency(%q<site_prism>.freeze, ["> 4".freeze, "< 6".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9".freeze])
end
