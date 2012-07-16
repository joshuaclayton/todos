Feature: Complete a todo
  In order to keep track of todos I've completed
  As a user
  I should be able to flag a todo as complete

  Scenario: Complete a todo
    Given I am signed in as "john@example.com"
    And I have the following todos:
      | description |
      | Buy milk    |
      | Buy eggs    |
    When I complete my todo "Buy milk"
    Then the todo "Buy milk" is complete
    But the todo "Buy eggs" is incomplete
