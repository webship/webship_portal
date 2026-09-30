Feature: The shell of every page
  As a visitor
  I want the same header, call to action and footer on every page
  So that the site reads as one site

  One Display Builder page layout prints the header, the call to action and
  the footer around the content of every page.

  Scenario Outline: <path> has the header, the call to action and the footer
    Given I am an anonymous user
     When I go to "<path>"
     Then the page should have 1 "header" landmark
      And the page should have 1 "footer" landmark
      And the page should have exactly one h1
      And I should see "Boost your site's success with automated testing"
      And I should see "For Commercial Professional Support"
      And the element "footer a img" with the attribute "alt" and the value containing "Daily Automated Functional Acceptance Testing" should exist
      And the element "footer .webtheme-footer-logo img" should be displayed
      And the link "Privacy" with the href "/privacy-policy" within the element "footer" should exist
      And the link "GitHub" with the href "https://github.com/webship" within the element "footer" should exist
      And I should see "Copyrights 2022" in the "footer" element
      And the page should not present Webship as a provider of site templates

    Examples:
      | path                               |
      | /                                  |
      | /products                          |
      | /products/webship-js               |
      | /products/webship-js/releases/2.0.6 |
      | /services                          |
      | /docs                              |
      | /docs/webship-js/2.0.x             |
      | /blog                              |
      | /about-us                          |
      | /contact                           |
      | /privacy-policy                    |
      | /no-such-page                      |

  Scenario: The browser tab of the log in page shows the Webship icon
    Given I am an anonymous user
     When I go to "/user/login"
     Then the element "link[rel='icon']" with the attribute "href" and the value containing "themes/contrib/webtheme/favicon.ico" should exist
