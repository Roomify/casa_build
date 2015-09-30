@api @javascript
Feature: Commerce Taxes
  In order to know if casa manager can set a tax

  Background:
    Given users:
      | name          | mail               | roles              |
      | _casa_owner   | casa@example.com   | rooms manager      |

  Scenario: Casa manager set a tax
    Given I am logged in as "_casa_owner"
    When I visit "admin/commerce/config/taxes/rates/add"
    Then I fill in the following:
      | Title          | Sales tax title   |
      | Display title  | Sales tax title   |
      | Description    | Tax description   |
      | Rate           | .20               |
    And I select "Sales tax" from "tax_rate[type]"
    And I press the "Save tax rate" button
    Then I should see "Tax rate saved."

    When I visit "admin/commerce/config/taxes/rates/add"
    Then I fill in the following:
      | Title          | VAT tax title     |
      | Display title  | VAT tax title     |
      | Description    | Tax description   |
      | Rate           | .20               |
    And I select "VAT" from "tax_rate[type]"
    And I press the "Save tax rate" button
    Then I should see "Tax rate saved."

    When I visit "admin/commerce/config/taxes"
    Then I click on "Delete" on the row containing "Sales tax title"
    And I press the "Delete" button
    Then I should see "The tax rate Sales tax title has been deleted."

    When I visit "admin/commerce/config/taxes"
    Then I click on "Delete" on the row containing "VAT tax title"
    And I press the "Delete" button
    Then I should see "The tax rate VAT tax title has been deleted."
