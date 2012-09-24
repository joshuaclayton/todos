Feature: Create a todo
  In order to remember what I have to do
  As a user
  I should be able to create a todo

  Scenario: Create a todo successfully
    Given I have signed in
    When I create a todo titled "Buy some milk"
    Then I should see the todo "Buy some milk"
