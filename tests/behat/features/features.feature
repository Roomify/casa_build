@api @javascript
Feature: Features status
  In order to know if all features are in default state after installation

  Background:
    Given I am logged in with the "administer features" permissions

  Scenario: Features status
    Given all features in the package "RoomifyCasa" are in default state
    And all features in the package "RoomifyCore" are in default state
