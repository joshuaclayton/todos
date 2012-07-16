Feature: Visit the homepage
  In order to start using the application
  As a guest
  I should be able to view the homepage

  Scenario: View the homepage as a guest
    When I go to the homepage
    Then I should see information about the application
