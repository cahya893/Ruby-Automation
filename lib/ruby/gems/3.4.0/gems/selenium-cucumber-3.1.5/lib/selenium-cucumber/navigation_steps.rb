require_relative 'methods/navigate_methods'

Then(/^I navigate to "([^\"]*)"$/)do |link|
  navigate_to(link)
end

Then(/^I navigate forward/) do
  navigate('forward')
end

Then(/^I navigate back/) do
  navigate('back')
end

Then(/^I close browser$/) do
  close_driver
end

# step to resize browser
Then(/^I resize browser window size to width (\d+) and height (\d+)$/) do |width, heigth|
  resize_browser(width, heigth)
end

# step to maximize browser
Then(/^I maximize browser window$/) do
  maximize_browser
end

# step to refresh page
Then(/^I refresh page$/) do
  $driver.navigate.refresh
end

# step to switch to new window
Then(/^I switch to new window$/) do
  switch_to_new_window
end

# step to switch to previous window
Then(/^I switch to previous window$/) do
  switch_to_previous_window
end

# step to switch to main window
Then(/^I switch to main window$/) do
  switch_to_main_window
end

Then(/^I switch to window having title "(.*?)"$/) do |window_title|
  switch_to_window_by_title window_title
end

Then(/^I switch to window having url "(.*?)"$/) do |window_url|
  switch_to_window_by_url window_url
end

# step to close new window
Then(/^I close new window$/) do
  close_new_window
end

# step to switch to main content
Then(/^I switch to main content$/) do
  switch_to_main_content
end

# step to switch to frame
Then(/^I switch to frame "(.*?)"$/) do |frame|
  switch_frame frame
end

# steps to scroll to element
Then(/^I scroll to element having (.+) "(.*?)"$/) do |type, access_name|
  validate_locator type
  scroll_to_element(type, access_name)
end

# steps to scroll web page to top or end
Then(/^I scroll to (top|end) of page$/) do |to|
  scroll_page(to)
end

# step to hover over a element       Note: Doesn't work on Windows firefox
When(/^I hover over element having (.+) "(.*?)"$/) do |type, access_name|
  validate_locator type
  hover_over_element(type, access_name)
end

# steps to zoom in page
Then(/^I zoom in page$/) do
  zoom_in_out('add')
end

# steps to zoom out page
Then(/^I zoom out page$/) do
  zoom_in_out('subtract')
end

# method to reset page view
Then(/^I reset page view$/) do
  zoom_in_out('numpad0')
end

# steps to zoom out till element displays
Then(/^I zoom out page till I see element having (.+) "(.*?)"$/) do |type, access_name|
  validate_locator type
  zoom_in_out_till_element_display(type, 'subtract', access_name)
end

