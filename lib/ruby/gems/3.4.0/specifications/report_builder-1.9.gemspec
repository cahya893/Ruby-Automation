# -*- encoding: utf-8 -*-
# stub: report_builder 1.9 ruby lib

Gem::Specification.new do |s|
  s.name = "report_builder".freeze
  s.version = "1.9".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rajat Thareja".freeze]
  s.date = "2020-06-06"
  s.description = "Ruby gem to merge Cucumber JSON reports and build mobile-friendly HTML Test Report, JSON report and retry file.".freeze
  s.email = "rajat.thareja.1990@gmail.com".freeze
  s.executables = ["report_builder".freeze]
  s.files = ["bin/report_builder".freeze]
  s.homepage = "https://reportbuilder.rajatthareja.com".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "Happy reporting!".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.requirements = ["Cucumber >= 2.1.0 test results in JSON format".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "ReportBuilder".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<json>.freeze, [">= 2.3.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["< 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["< 4.0".freeze])
end
