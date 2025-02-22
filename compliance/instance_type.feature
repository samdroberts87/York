Feature: Ensure all EC2 instances use approved instance types

  Scenario: Only approved instance types are allowed
    Given I have resource that supports tags
    When its type is aws_instance
    And it has instance_type
    Then its value must be in ["t2.micro", "t2.medium", "t2.large"]
