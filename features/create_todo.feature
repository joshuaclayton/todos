Feature: User creates a todo
  In order to know what I need to get done
  As a user
  I should be able to create a todo

  Scenario: User creates a valid todo
    Given I have signed in
    When I create a todo
    Then I should have 1 todo

  Scenario: User creates an invalid todo
    Given I have signed in
    When I create an invalid todo
    Then I should see an error message
    And I should have no todos
