Feature: Manage todos
  In order to keep track of what I need to do
  As a user
  I should be able to manage all my todos

  Scenario: Create a new todo
    Given I have signed in as "john@example.com"
    When I create a todo titled "Buy milk"
    Then I should see the following todos:
      | title    |
      | Buy milk |

  Scenario: Only view my own todos
    Given "jane@example.com" has the following todos:
      | title                   |
      | Go to the grocery store |
      | Go to the mall          |
      | Go to school            |
    And I have signed in as "john@example.com"
    Then I should not see the following todos:
      | title                   |
      | Go to the grocery store |
      | Go to the mall          |
      | Go to school            |

  Scenario: Complete a todo
    Given I have signed in as "john@example.com"
    When I create a todo titled "Buy milk"
    And I complete the todo "Buy milk"
    Then "Buy milk" should be completed
