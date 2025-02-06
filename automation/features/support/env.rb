require 'selenium-webdriver'
require 'cucumber'
require 'site_prism'
require 'rspec'
require_relative '../page/halaman_login'
require_relative '../support/screen'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'byebug'

# Set the path to the ChromeDriver executable
Capybara.default_driver = :selenium

#set browser
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

report_root = File.absolute_path('./report')

if ENV['REPORT_PATH'].nil?
puts ' ========Deleting old reports ang logs========='
FileUtils.rm_rf(report_root, secure: true)
end

ENV['REPORT_PATH'] ||= Time.now.strftime('%F_%H-%M-%S')
path = "#{report_root}/#{ENV['REPORT_PATH']}"
FileUtils.mkdir_p path