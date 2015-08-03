Feature: Homepage
  In order to know the website is running
  As a website user
  I need to be able to view the site title and login

  Scenario: Viewing the site title
    Given I am on the homepage
    Then I should see "The Casa"

  @api
  Scenario: Logging into the site
    Given I am logged in as a user with the "authenticated user" role on this site
    And I am on the homepage
    Then I should see "Menu"
