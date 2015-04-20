Given /^I am on the Welcome Screen$/ do
  element_exists("HomeViewController")
  sleep(STEP_PAUSE)
end

Given /^I am on the User Activity Screen$/ do
  element_exists("UserActivityViewController")
  sleep(STEP_PAUSE)
end

Given /^I am on the Preferences Screen$/ do
  element_exists("PreferencesViewController")
  sleep(STEP_PAUSE)
end

Given /^I am on the Search Screen$/ do
  element_exists("searchPeople")
  sleep(STEP_PAUSE)
end

Then (/^I wait until I see "(.*?)"$/) do |arg|
  query("label marked:arg")
end

Then (/^I will touch the Search$/) do
  #touch("button marked : 'Search'")
  wait_for_element_exists("button marked : 'Search'", :timeout => 10)
  tap_mark 'Search'
end

Given /^I am entering credentials$/ do
  touch("textField placeholder: 'Username'")
  wait_for_keyboard
  keyboard_enter_text("my_username")
  touch("textField placeholder: 'Password'")
  wait_for_keyboard
  keyboard_enter_text("my_password")
  touch("textField placeholder: 'Confirm Password'")
  wait_for_keyboard
  keyboard_enter_text("my_password")
  touch("button marked : 'Register'")
end

Given /^I am entering login credentials$/ do
  touch("textField placeholder: 'Username'")
  wait_for_keyboard
  keyboard_enter_text("my_username")
  touch("textField placeholder: 'Password'")
  wait_for_keyboard
  keyboard_enter_text("my_password")
  touch("button marked : 'Login'")
  #element_exists("UserActivityViewController")
  #sleep(STEP_PAUSE)
  #touch("button marked : 'Search'")
end

Given /^I am entering Preferences values$/ do
end
   
#definition for alert button (work around)
def touch_alert_button(button)
  btn = query("view:'_UIModalItemTableViewCell' label marked:'#{button}'").first.empty?
  if (btn)
    screenshot_and_raise "button not found '#{button}'"
  else
    touch("view:'_UIModalItemTableViewCell' label marked:'#{button}'").first
    sleep(0.2)
  end
end
