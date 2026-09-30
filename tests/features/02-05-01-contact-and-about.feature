Feature: The contact and about pages
  As a visitor
  I want to know who Webship.co is and how to reach it
  So that I can ask for support

  Scenario: The contact page has the details, the location and the form
    Given I am an anonymous user
     When I go to "/contact"
     Then I should see "Contact" in the "h1" element
      And the link "+962 7 9000 2280" with the href "tel:+962790002280" should exist
      And the link "info@webship.co" with the href "mailto:info@webship.co" should exist
      And I should see "Amman, Jordan"
      And I should see "7 Paris St., 3rd Floor"
      And I should see "Location map"
      And "main form.webform-submission-contact-form" should be visible
      And I should see "We'd love to talk to you"
      And "select[name='team_size']" should be visible
      And "input[name='job_title']" should be visible
      And every form field should have an accessible label
      And the heading hierarchy should be valid

  Scenario: The about page says what Webship.co loves to help with
    Given I am an anonymous user
     When I go to "/about-us"
     Then I should see "About us" in the "h1" element
      And I should see "Love to help in speeding up the work of having Automated Functional Acceptance Testing for products to ship websites in a swift way."
      And I should see "We LOVE to help with:"
      And I should see "Writing Cucumber descriptions, Gherkin scripts for web apps."
      And the link "See all services" with the href "/services" should exist
      And the heading hierarchy should be valid
