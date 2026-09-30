@a11y
Feature: Accessibility of the pages
  As a visitor who uses assistive technology
  I want every page to have alternative text, one main heading and labels
  So that I can read and use the site

  Scenario Outline: <path> meets the accessibility checks
    Given I am an anonymous user
     When I go to "<path>"
     Then the page should have exactly one h1
      And every image should have an alt attribute
      And every link should have an accessible name
      And every form field should have an accessible label
      And the page should have a main landmark
      And the page should pass an accessibility audit at level "AAA"

    Examples:
      | path                                  |
      | /                                     |
      | /products                             |
      | /services                             |
      | /docs                                 |
      | /docs/webship-js/2.0.x                |
      | /blog                                 |
      | /blog/webship-js-advanced-screenshots |
      | /about-us                             |
      | /contact                              |
