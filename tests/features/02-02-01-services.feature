Feature: The services
  As a visitor
  I want to read what Webship.co offers
  So that I can ask for help with automated functional testing

  Scenario: The three services of Webship.co
    Given I am an anonymous user
     When I go to "/services"
     Then I should see "Services" in the "h1" element
      And I should see "Automated Functional Testing Setup"
      And I should see "Configure Remote CI/CD"
      And I should see "Cucumber/Gherkin descriptions"
      And I should see "Prepare projects to run with public or private CI/CD remote servers."
      And the link "GitHub Actions" with the href "https://github.com/features/actions" should exist
      And every image should have an alt attribute
      And the heading hierarchy should be valid
