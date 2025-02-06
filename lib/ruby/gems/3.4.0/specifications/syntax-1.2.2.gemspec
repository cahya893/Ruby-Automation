# -*- encoding: utf-8 -*-
# stub: syntax 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "syntax".freeze
  s.version = "1.2.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jamis Buck".freeze]
  s.date = "2017-07-03"
  s.description = "Syntax is Ruby library for performing simple syntax highlighting.".freeze
  s.email = "jamis@jamisbuck.org".freeze
  s.homepage = "https://github.com/dblock/syntax".freeze
  s.licenses = ["BSD".freeze]
  s.rubygems_version = "1.8.30".freeze
  s.summary = "Perform simple syntax highlighting.".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 3

  s.add_development_dependency(%q<rake>.freeze, ["< 11.0.0".freeze])
  s.add_development_dependency(%q<rake-contrib>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<test-unit>.freeze, [">= 0".freeze])
end
