Feature: Complete my todos
  In order to differentiate between things to do and things I've done
  As a user
  I should be able to complete my todos

  Scenario: Complete a todo
    Given I have signed in
    When I create a todo titled "Buy some milk"
    And I complete the todo "Buy some milk"
    Then "Buy some milk" should be marked completed
