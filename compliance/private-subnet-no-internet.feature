Feature: Ensure only public route tables have internet access

  Scenario: Non-public route tables must not have a 0.0.0.0/0 route
    Given I have an aws_route_table resource
    When its tags.Name does not contain "public"
    Then it must not contain route[*].cidr_block
    And its value must not match the regular expression ^0.0.0.0/0$
