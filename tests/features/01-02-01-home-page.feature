Feature: The home page
  As a visitor
  I want the home page to say what Webship.co does
  So that I know it helps with automated functional testing

  Background:
    Given I am an anonymous user
     When I go to the homepage

  Scenario: The hero shows a short headline, two buttons and the video
     Then I should see "We love to help you automate testing" in the "h1" element
      And "h1.uk-heading-medium" should be visible
      And I should see "Automated functional acceptance testing, to ship websites in a swift way."
      And "main .uk-section-primary a.uk-button" should have a count of 2
      And the link "Products" with the href "/products" within the element ".uk-section-primary" should exist
      And the link "Contact us" with the href "/contact" within the element ".uk-section-primary" should exist
      And the element ".uk-section-primary video source" with the attribute "src" and the value containing "love-to-help.mp4" should exist
      And the element ".uk-section-primary video" with the attribute "aria-label" and the value containing "Webship.co" should exist

  Scenario Outline: The headline fits the hero card at <width> pixels
     When I set the viewport width to <width>
      And I go to the homepage
     Then "h1.uk-heading-medium" should be visible
      And the page should not scroll horizontally
      And the hero headline should fit its card

    Examples:
      | width |
      | 1440  |
      | 390   |

  Scenario: The first section says what Webship.co loves to help with
     Then I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way." in the "main h2" element
      And I should see "We LOVE to help with:"
      And "main ul.uk-list-bullet:first-of-type li" should have a count of 4
      And I should see "Writing Cucumber descriptions, Gherkin scripts for web apps."
      And the link "GitHub Actions" with the href "https://github.com/features/actions" should exist

  Scenario: The blog block shows the three latest posts
     Then I should see "Blog"
      And I should see "Webship-js Adds Diffy API Support: Visual Regression Testing from Plain Gherkin"
      And I should see "Webship-js Advanced Screenshots"
      And I should see "Keeping Tests Stable: Waits and Selectors"
      And I should not see "Advanced Selectors in Webship-js: A Named Registry for Stable, Readable Layout Tests"
      And the link "See all posts" with the href "/blog" should exist

  Scenario: The latest release of Webship-js is shown
     Then I should see "Latest release"
      And the link "2.0.6" with the href "/products/webship-js/releases/2.0.6" should exist

  Scenario: The services block leads to the services and the contact page
     Then I should see "Automated Functional Testing Setup"
      And the link "See all services" with the href "/services" should exist
      And the link "Contact us" with the href "/contact" should exist

  Scenario: The newsletter form is on the home page
     Then "main form.webform-submission-newsletter-subscribe-form" should be visible
      And I should see "By subscribing to our newsletter, you agree to our"
      And the link "Privacy Policy" with the href "/privacy-policy" should exist

  Scenario: The home page is about automated functional testing
     Then the page should not present Webship as a provider of site templates
