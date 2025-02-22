Feature: Ensure all EC2 instances use approved instance types

  Scenario: Only approved instance types are allowed
    Given I have an aws_instance resource
    When it has instance_type
    Then its value must be in ["t2.micro", "t2.medium", "t2.large"]
