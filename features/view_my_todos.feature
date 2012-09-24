Feature: View my todos
  In order to understand the todos I need to accomplish
  As a user
  I should be able to view my todos

  Scenario: View only my todos
    Given "not-me@example.com" has 2 todos
    And "me@example.com" has 3 todos
    When I sign in as "me@example.com"
    And I view my todos
    Then I should see 3 todos
