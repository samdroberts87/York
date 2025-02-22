Feature: Ensure resources are deployed in the correct region

  Scenario: All AWS resources must be in eu-west-1
    Given I have a provider.aws resource
    Then its region must equal "eu-west-2"
