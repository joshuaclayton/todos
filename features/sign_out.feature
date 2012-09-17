Feature: Sign out
  In order to make sure no one else manages my todos
  As a user
  I should be able to sign out of my account

  Scenario: Sign out of a signed in account
    Given I have signed in as "john@example.com"
    When I sign out
    Then I should be signed out
