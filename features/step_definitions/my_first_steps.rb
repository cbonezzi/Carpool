Given /^I am on the Welcome Screen$/ do
  element_exists("HomeViewController")
  sleep(STEP_PAUSE)
end

Then (/^I wait until I see "(.*?)"$/) do |arg|
  query("label marked:arg")
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
