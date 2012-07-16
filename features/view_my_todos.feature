Feature: View my todos
  In order to plan my day
  As a user
  I should see all my todos

  Scenario: View my todos
    Given I am signed in as "john@example.com"
    And I have the following todos:
      | description     |
      | Buy milk        |
      | Buy eggs        |
      | Walk the dog    |
      | Pick up laundry |
    When I view my todos
    Then I should see my todo "Buy milk"
    And I should see my todo "Buy eggs"
    And I should see my todo "Walk the dog"
    And I should see my todo "Pick up laundry"

  Scenario: I cannot see another user's todos
    Given I am signed in as "john@example.com"
    When I create the todo "Buy some milk"
    And I sign out
    And I sign in as "jane@example.com"
    And I create the todo "Buy some eggs"
    Then I should see my todo "Buy some eggs"
    But I should not see the todo "Buy some milk"
