@male_invite_female_partner @signup @regression @all
Feature: Male invites female partner
  @non_ttc_female_partner_signup
  Scenario: Male invites Non-TTC female partner
    Given I am a new "Single Male" user
    And I open Glow for the first time
    When I sign up as a single male user
    And I finish the tutorial
    Then I should see "Complete log"
    And I open "Me" page
    And I invite my female partner
    And I logout

    And I am the female partner and my type is "Non-TTC"
    And I open Glow for the first time
    And I touch the "Get Started!" button
    And I select the user type "Avoiding pregnancy"
    And I complete Non-TTC onboarding step 1
    And I complete Non-TTC onboarding step 2
    And I fill in email name password and birthday
    And I close the onboarding popup
    And I finish the tutorial
    Then I should see "Complete log"
    And I logout

  @ttc_female_partner_signup
  Scenario: Male invites TTC female partner
    Given I am a new "Single Male" user
    And I open Glow for the first time
    When I sign up as a single male user
    And I finish the tutorial
    Then I should see "Complete log"
    And I open "Me" page
    And I invite my female partner
    And I logout

    And I am the female partner and my type is "TTC"
    And I open Glow for the first time
    And I touch the "Get Started!" button
    And I select the user type "Trying to conceive"
    And I complete TTC onboarding step 1
    And I complete TTC onboarding step 2
    And I fill in email name password and birthday
    And I close the onboarding popup
    And I finish the tutorial
    Then I should see "Complete log"
    And I logout

  @med_female_partner_signup
  Scenario: Male invites Med female partner
    Given I am a new "Single Male" user
    And I open Glow for the first time
    When I sign up as a single male user
    And I finish the tutorial
    Then I should see "Complete log"
    And I open "Me" page
    And I invite my female partner
    And I logout

    And I am the female partner and my type is "Med"
    And I open Glow for the first time
    And I touch the "Get Started!" button
    And I select the user type "Fertility treatments"
    
    And I choose "Intercourse with fertility medication" status for fertility treatment
    And I complete Fertility Treatment onboarding step 2
    And I complete Fertility Treatment onboarding step 3
    And I fill in email name password and birthday
    And I finish the tutorial
    Then I should see "Complete log"
    And I logout

  @iui_female_partner_signup
  Scenario: Male invites IUI female partner
    Given I am a new "Single Male" user
    And I open Glow for the first time
    When I sign up as a single male user
    And I finish the tutorial
    Then I should see "Complete log"
    And I open "Me" page
    And I invite my female partner
    And I logout

    And I am the female partner and my type is "IUI"
    And I open Glow for the first time
    And I touch the "Get Started!" button
    And I select the user type "Fertility treatments"

    And I choose "Intrauterine Insemination (IUI)" status for fertility treatment
    And I complete Fertility Treatment onboarding step 2
    And I complete Fertility Treatment onboarding step 3
    And I fill in email name password and birthday
    And I finish the tutorial
    Then I should see "Complete log"
    And I logout
  
