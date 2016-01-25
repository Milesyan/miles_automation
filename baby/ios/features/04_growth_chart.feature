@growth_chart @regression
Feature: Growth chart log weight, height and head circ
  @log_weight
  Scenario: Log weight
    Given I create a new mother with 1 born boy whose birthday is "2.weeks.ago"
    And I login
    And I scroll to growth chart
    And I log weight "3.0kg" on "5.days.ago"
    And I log weight "3.1kg" on "3.days.ago"
    And I log weight "3.2kg" on "today"
    And I close the insight popup
    And I logout

  @height
  Scenario: Log height
    Given I create a new father with 1 born girl whose birthday is "1.week.ago"
    And I login
    And I scroll to growth chart
    And I log height "40 cm" on "6.days.ago"
    And I log height "16 in" on "3.days.ago"
    And I log height "45 cm" on "1.day.ago"
    And I logout