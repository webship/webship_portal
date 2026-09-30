Feature: The main menu
  As a visitor
  I want the main menu of Webship.co
  So that I reach every part of the site from any page

  Scenario Outline: The main menu has its seven links once each, in order, on <path>
    Given I am an anonymous user
     When I go to "<path>"
     Then the links of "header .uk-navbar-nav" should be in this order:
        | Home     |
        | Products |
        | Services |
        | Docs     |
        | Blog     |
        | About us |
        | Contact  |

    Examples:
      | path      |
      | /         |
      | /products |
      | /blog     |

  Scenario: The menu of the phone has the same seven links once each
    Given I am an anonymous user
     When I go to the homepage
     Then the links of "#webship-offcanvas .uk-nav-primary" should be in this order:
        | Home     |
        | Products |
        | Services |
        | Docs     |
        | Blog     |
        | About us |
        | Contact  |

  Scenario: The footer menus have each link once
    Given I am an anonymous user
     When I go to the homepage
     Then the links of "footer .uk-subnav-divider" should be in this order:
        | Privacy  |
        | About us |
        | Contact  |
      And the links of "footer .uk-subnav:not(.uk-subnav-divider)" should be in this order:
        | GitHub    |
        | GitLab    |
        | Bitbucket |
        | X         |
        | LinkedIn  |
        | YouTube   |

  Scenario Outline: The "<label>" menu link opens its page
    Given I am an anonymous user
     When I go to the homepage
     Then the link "<label>" with the href "<path>" within the element "header .uk-navbar-nav" should exist
     When I go to "<path>"
     Then I should see "<title>" in the "h1" element

    Examples:
      | label    | path      | title         |
      | Products | /products | Products      |
      | Services | /services | Services      |
      | Docs     | /docs     | Documentation |
      | Blog     | /blog     | Blog          |
      | About us | /about-us | About us      |
      | Contact  | /contact  | Contact       |

  Scenario: The menu opens from the toggle on a phone
    Given I am an anonymous user
     When I set the viewport to the "xs" breakpoint
      And I go to the homepage
     Then "header .uk-navbar-toggle" should be visible
      And "header .uk-navbar-nav" should be hidden
      And the page should not scroll horizontally
