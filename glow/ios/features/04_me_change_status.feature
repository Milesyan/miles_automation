@change_status @regression
Feature: User should be able to change status on Me page
  @non_ttc_to_ttc
  Scenario: Change status from Non-TTC to TTC
    Given I register a new "Non-TTC" user
    And I open "me" page
    And I change to "TTC" status
    And I logout
  @non_ttc_to_pregnant
  Scenario: Change status from Non-TTC to I'm pregnant
    Given I register a new "Non-TTC" user
    And I open "me" page
    And I change to "pregnant" status
    And I logout
  @ttc_to_pregnant
  Scenario: Change status from TTC to I'm pregnant
    Given I register a new "TTC" user
    And I open "me" page
    And I change to "pregnant" status
    And I logout
  @ttc_to_prep
  Scenario: Change status from TTC to Prep
    Given I register a new "TTC" user
    And I open "me" page
    And I change to "prep" status
    And I logout
  @ttc_to_med
  Scenario: Change status form TTC to Med
    Given I register a new "TTC" user
    And I open "me" page
    And I change to "med" status
    And I logout
  @ttc_to_iui
  Scenario: Change status from TTC to IUI
    Given I register a new "TTC" user
    And I open "me" page
    And I change to "iui" status
    And I logout
  @ttc_to_ivf
  Scenario: Change status from TTC to IVF
    Given I register a new "TTC" user
    And I open "me" page
    And I change to "ivf" status
    And I logout