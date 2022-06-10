*** Settings ***
Documentation   Counter app test suite
Resource        counter_app_keywords.resource
Test Setup      Open the counter app
Test Teardown   Close the counter app

*** Test Cases ***

Counter app increment counter
    Given I have opened the counter app
    When I click on the increment button    6
    Then the counter should incremented by  6

Counter app shows about dialog
    Given I have opened the counter app
    When I click on the drawer menu icon
    And I click on the about item
    Then the about dialog should be shown

Complex test case
    Given I have opened the counter app
    When I click on the increment button    6
    Then the counter should incremented by  6
    When I click on the dash icon
    Then the reset counter button should be displayed
    When I click on the reset counter button
    And I click on the calculate icon
    Then the counter should incremented by  0
    When I click on the increment button    3
    Then the counter should incremented by  3