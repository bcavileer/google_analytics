Feature: Print Report

  Background:
    Given I am logged in

  Scenario:
    Given a profile
    When I run the report
    Then I should see events


