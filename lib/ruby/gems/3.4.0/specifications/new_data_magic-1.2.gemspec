# -*- encoding: utf-8 -*-
# stub: new_data_magic 1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "new_data_magic".freeze
  s.version = "1.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeff Morgan".freeze, "Lutfi Fitroh Hadi".freeze]
  s.date = "2021-10-29"
  s.description = "Provides datasets to application stored in YAML files".freeze
  s.email = ["jeff.morgan@leandog.com".freeze, "lutfi1304@gmail.com".freeze]
  s.homepage = "http://github.com/firstlutfi/data_magic".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Provides datasets to application via YAML files".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faker>.freeze, [">= 1.9".freeze])
  s.add_runtime_dependency(%q<yml_reader>.freeze, [">= 0.6".freeze])
  s.add_development_dependency(%q<cucumber>.freeze, [">= 1.2.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 2.12.0".freeze])
end
