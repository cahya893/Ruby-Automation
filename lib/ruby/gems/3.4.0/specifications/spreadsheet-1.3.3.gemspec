# -*- encoding: utf-8 -*-
# stub: spreadsheet 1.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "spreadsheet".freeze
  s.version = "1.3.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/zdavatz/spreadsheet/blob/master/History.md", "funding_uri" => "https://github.com/sponsors/zdavatz" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Hannes F. Wyss, Masaomi Hatakeyama, Zeno R.R. Davatz".freeze]
  s.date = "2024-11-20"
  s.description = "As of version 0.6.0, only Microsoft Excel compatible spreadsheets are supported".freeze
  s.email = "hannes.wyss@gmail.com, mhatakeyama@ywesee.com, zdavatz@ywesee.com".freeze
  s.executables = ["xlsopcodes".freeze]
  s.files = ["bin/xlsopcodes".freeze]
  s.homepage = "https://github.com/zdavatz/spreadsheet".freeze
  s.licenses = ["GPL-3.0".freeze]
  s.rubygems_version = "3.5.3".freeze
  s.summary = "The Spreadsheet Library is designed to read and write Spreadsheet Documents".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<bigdecimal>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<ruby-ole>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<test-unit>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
end
