Feature: Guest views todos
  In order to prevent me from creating todos
  As a guest
  I should be taken to the sign in page when trying to access todos

  Scenario: View todos without being signed in
    When I view my todos
    Then I should be prompted to sign in
