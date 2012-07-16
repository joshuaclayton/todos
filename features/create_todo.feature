Feature: Create a todo
  In order to remind myself of something I need to do
  As a user
  I should be able to create a todo

  Scenario: Create a todo
    Given I am signed in as "john@example.com"
    When I create the todo "Buy some milk"
    Then I should see my todo "Buy some milk"
