Feature: Complete a todo
  In order to keep track of todos I thought I completed but didn't
  As a user
  I should be able to flag a todo as incomplete

  Scenario: Incomplete a todo
    Given I am signed in as "john@example.com"
    And I have the following todos:
      | description |
      | Buy milk    |
      | Buy eggs    |
    When I flag my todo "Buy milk" complete
    Then the todo "Buy milk" is complete
    But the todo "Buy eggs" is incomplete
    When I flag my todo "Buy milk" incomplete
    Then the todo "Buy milk" is incomplete
    And the todo "Buy eggs" is incomplete
