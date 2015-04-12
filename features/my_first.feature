Feature: Running a test
  As a carpool user
  I want to access the home page
  So I can begin to use carpooling app

  Scenario: Welcome to carpooling and signup
    Given I am on the Welcome Screen
    Then I touch the "Start" button
    And I wait until I see "Get Started..with Pull-it!!"
    Then I touch the "SignUp" button
    And I wait until I see "Sign Up"
    Given I am entering credentials
    #Then I touch the "Register" button
    #Then I touch the "OK" button
    Then I am on the Welcome Screen
    And I wait until I see "Get Started..with Pull-it!!"
