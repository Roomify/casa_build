<?php

use Drupal\DrupalExtension\Context\DrupalSubContextBase,
    Drupal\Component\Utility\Random;

use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;

use Behat\Behat\Hook\Scope\BeforeScenarioScope,
    Behat\Behat\Hook\Scope\AfterScenarioScope;

use Behat\Behat\Context\CustomSnippetAcceptingContext;

use Drupal\DrupalDriverManager;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends DrupalSubContextBase implements CustomSnippetAcceptingContext {

  /**
   * The Mink context
   *
   * @var Drupal\DrupalExtension\Context\MinkContext
   */
  private $minkContext;

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct(DrupalDriverManager $drupal) {
    parent::__construct($drupal);
  }

  public static function getAcceptedSnippetType() { return 'regex'; }

  /**
   * @BeforeScenario
   */
  public function before(BeforeScenarioScope $scope) {
    $environment = $scope->getEnvironment();
    $this->minkContext = $environment->getContext('Drupal\DrupalExtension\Context\MinkContext');
  }

  /**
   * @AfterScenario
   */
  public function after(AfterScenarioScope $scope) {
  }

}
