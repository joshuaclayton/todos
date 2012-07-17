Feature: Create a todo
  In order to remind myself of something I need to do
  As a user
  I should be able to create a todo

  Scenario: Create a todo
    Given I am signed in as "john@example.com"
    When I create the todo "Buy some milk"
    Then I should see my todo "Buy some milk"

  Scenario: Create a todo without being logged in
    When I view my todos
    And I attempt to create the todo "Buy some milk"
    Then I should be prompted to sign in
    When I sign in as "john@example.com"
    Then I should not see the todo "Buy some milk"
