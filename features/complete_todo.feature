Feature: Complete a todo
  In order to know what remaining todos I need to finish
  As a user
  I should be able to complete todos

  Scenario: Complete a todo
    Given I have signed in
    And I have the following todos:
      | name      |
      | Buy milk  |
      | Buy eggs  |
      | Buy flour |
    When I mark the todo "Buy flour" as completed
    Then my list of incomplete todos should be:
      | name     |
      | Buy milk |
      | Buy eggs |
    And my list of complete todos should be:
      | name      |
      | Buy flour |
