# -*- encoding: utf-8 -*-
# stub: autoit 1.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "autoit".freeze
  s.version = "1.3.4".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/rpossan/autoit/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/rpossan/autoit", "source_code_uri" => "https://github.com/rpossan/autoit" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ronaldo Possan".freeze, "Fabio Valonga".freeze]
  s.date = "2019-04-16"
  s.description = "    AutoIt is a gem to integrate in your automation project and tests using the AutoIt software for interact with\n    Windows OLE objects. With AutoIt gem you can run the easy wrapper methods or run natives AutoIt commands.\n".freeze
  s.email = ["ronaldo.possan@gmail.com".freeze, "fabiosv.etep@gmail.com".freeze]
  s.executables = ["autoit".freeze]
  s.files = ["bin/autoit".freeze]
  s.homepage = "https://github.com/rpossan/autoit".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A ruby gem wrapper to interface with AutoIt".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<os>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16".freeze])
  s.add_development_dependency(%q<byebug>.freeze, ["~> 10.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0.49.0".freeze])
end
