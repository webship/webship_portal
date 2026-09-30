Feature: The products and their releases
  As a visitor
  I want to see the testing products of Webship.co
  So that I can install them and follow their releases

  Scenario: The products are Webship-js, its plugins and the portal
    Given I am an anonymous user
     When I go to "/products"
     Then I should see "Products" in the "h1" element
      And "main .uk-card" should have a count of 6
      And the link "Webship-js" with the href "/products/webship-js" should exist
      And the link "Diffy steps" with the href "/products/diffy-steps" should exist
      And the link "Webship-js AI agent" with the href "/products/webship-js-ai-agent" should exist
      And the link "Webship-js skills" with the href "/products/webship-js-skills" should exist
      And the link "DDEV Webship-JS add-on" with the href "/products/ddev-webship-js" should exist
      And the link "Webship-portal" with the href "/products/webship-portal" should exist
      And the text "Diffy steps" should appear after the text "Webship-js is an Automated Functional Acceptance Testing tool."
      And the text "AI agent and skills" should appear after the text "Diffy steps"
      And I should see "npm install --save-dev webship-js @webship-js/diffy-steps"
      And the heading hierarchy should be valid
      And every image should have an alt attribute

  Scenario: Webship-js lists its releases
    Given I am an anonymous user
     When I go to "/products/webship-js"
     Then I should see "Webship-js" in the "h1" element
      And I should see "npm install webship-js --save-dev"
      And the link "2.0.6" with the href "/products/webship-js/releases/2.0.6" should exist
      And the link "2.0.0" with the href "/products/webship-js/releases/2.0.0" should exist

  Scenario: The Diffy steps plugin has its npm package and its release
    Given I am an anonymous user
     When I go to "/products/diffy-steps"
     Then I should see "Diffy steps" in the "h1" element
      And I should see "npm install --save-dev webship-js @webship-js/diffy-steps"
      And the link "Diffy steps on npm" with the href "https://www.npmjs.com/package/@webship-js/diffy-steps" should exist
      And the link "2.0.0" with the href "/products/diffy-steps/releases/2.0.0" should exist

  Scenario: A release keeps the dots of its version in its address
    Given I am an anonymous user
     When I go to "/products/webship-js/releases/2.0.6"
     Then I should see "2.0.6" in the "h1" element
      And I should see "Fixed since Webship-js 2.0.5:"
      And the link "GitHub release" with the href "https://github.com/webship/webship-js/releases/tag/2.0.6" should exist
