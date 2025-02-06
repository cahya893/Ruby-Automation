require 'selenium-webdriver'
require_relative '../page/halaman_login'
require_relative '../support/screen'
require 'rubyXL'
require 'rubyXL/convenience_methods/cell'
require 'rubyXL/convenience_methods/color'
require 'rubyXL/convenience_methods/font'
require 'rubyXL/convenience_methods/workbook'
require 'rubyXL/convenience_methods/worksheet'
require 'win32ole'
require 'spreadsheet'
require 'autoit'



Before do |scenario|
  Capybara.app_host = 'https://my-v2-stg-ic.pawoon.com'
  Capybara.javascript_driver = :chrome
  @pusathalaman = PawoonPages.new
  #page.driver.browser.manage.window.resize_to(1920,1080)
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  ## logic that will run after each scenario

  if(scenario.failed?)
  # TODO: take screenshots
  end

end

AfterStep do |scenario|
  # logic that will run after each step in a scenario
end
