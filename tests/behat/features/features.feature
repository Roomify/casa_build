@api @javascript
Feature: Features status
  In order to know if all features are in default state after installation

  Background:
    Given I am logged in with the "administer features" permissions

  Scenario: Features status
    When I visit "admin/structure/features/casa_activity/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_address_footer/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_amenities/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_example_content/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_features/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_footer_bean_type/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_further_info/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_homepage/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_homepage_content_type/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_image_styles/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_page/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_roles_and_permissions/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_slideshow/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_unit_type/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/casa_widget/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/mapping/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/roomify_galleria/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/roomify_lingo/status"
    Then I should see "{\"storage\":0}"

    When I visit "admin/structure/features/roomify_rich_text/status"
    Then I should see "{\"storage\":0}"
