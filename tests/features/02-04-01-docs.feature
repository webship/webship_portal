Feature: The documentation
  As a visitor
  I want the documentation of Webship-js
  So that I can install it and write scenarios

  Scenario: The documentation page has a search form and the three guides
    Given I am an anonymous user
     When I go to "/docs"
     Then I should see "Documentation" in the "h1" element
      And the element "main form[role='search']" with the attribute "action" and the value containing "/search/node" should exist
      And the link "Webship-JS 2.0.x" with the href "/docs/webship-js/2.0.x" should exist
      And the link "Install Webship-JS" with the href "/docs/webship-js/2.0.x/install-webship-js" should exist
      And the link "Step Definitions" with the href "/docs/webship-js/2.0.x/step-definitions" should exist
      And the heading hierarchy should be valid

  Scenario Outline: The guide "<title>" has the text of Webship.co
    Given I am an anonymous user
     When I go to "<path>"
     Then I should see "<title>" in the "h1" element
      And I should see "<text>"

    Examples:
      | path                                      | title              | text                           |
      | /docs/webship-js/2.0.x                    | Webship-JS 2.0.x   | Highlights in 2.0.x            |
      | /docs/webship-js/2.0.x/install-webship-js | Install Webship-JS | npm install webship-js --save-dev |
      | /docs/webship-js/2.0.x/step-definitions   | Step Definitions   | How steps are organized        |

  Scenario: The search form opens the search page
    Given I am an anonymous user
     When I go to "/docs"
      And I fill in "Search the documentation" with "Playwright"
      And I press the key "Enter"
     Then the url should match "/search/node"
      And I should see "Search" in the "h1" element
