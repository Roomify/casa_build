<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /**
   * Check logged in status.
   *
   * Overrides RawDrupalContext::loggedIn().
   * @see https://github.com/jhedstrom/drupalextension/pull/131.
   */
  public function loggedIn() {
    $session = $this->getSession();
    $page = $session->getPage();

    // Body class check from pull/131.
    $body = $page->find('css', 'body');
    return $body->hasClass('logged-in');
  }

  /**
   * RawDrupalContext::assertAnonymousUser() with better logged in check.
   *
   * @Given I am an anonymous user on this site
   * @Given I am not logged in on this site
   */
  public function assertAnonymousUserOnThisSite() {
    // Verify the user is logged out.
    if ($this->loggedIn()) {
      $this->logout();
    }
  }

  /**
   * Creates and authenticates a user with the given role(s).
   *
   * RawDrupalContext::assertAuthenticatedByRole() with better logged in check.
   *
   * @Given I am logged in as a user with the :role role(s) on this site
   */
  public function assertAuthenticatedByRoleOnThisSite($role) {
    // Check if a user with this role is already logged in.
    if (!$this->loggedInWithRole($role)) {
      // Create user (and project)
      $user = (object) array(
        'name' => $this->getRandom()->name(8),
        'pass' => $this->getRandom()->name(16),
        'role' => $role,
      );
      $user->mail = "{$user->name}@example.com";

      $this->userCreate($user);

      $roles = explode(',', $role);
      $roles = array_map('trim', $roles);
      foreach ($roles as $role) {
        if (!in_array(strtolower($role), array('authenticated', 'authenticated user'))) {
          // Only add roles other than 'authenticated user'.
          $this->getDriver()->userAddRole($user, $role);
        }
      }

      // Login.
      $this->login();
    }
  }

}
