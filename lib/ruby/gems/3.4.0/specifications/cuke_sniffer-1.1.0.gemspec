# -*- encoding: utf-8 -*-
# stub: cuke_sniffer 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cuke_sniffer".freeze
  s.version = "1.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robert Cochran".freeze, "Chris Vaughn".freeze, "Robert Anderson".freeze]
  s.date = "2017-02-07"
  s.description = "A ruby library used to root out smells in your cukes.".freeze
  s.email = "robert.cochran.dev@gmail.com".freeze
  s.executables = ["cuke_sniffer".freeze]
  s.files = ["bin/cuke_sniffer".freeze]
  s.homepage = "https://github.com/r-cochran/cuke_sniffer".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.1".freeze
  s.summary = "CukeSniffer".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6".freeze, ">= 1.6.8".freeze])
  s.add_runtime_dependency(%q<roxml>.freeze, ["~> 3.3".freeze, ">= 3.3.1".freeze])
end
