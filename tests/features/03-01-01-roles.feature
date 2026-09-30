Feature: The roles of the site
  As a site owner
  I want each role to do its work and no more
  So that editors maintain the content and visitors only read it

  Scenario: A visitor cannot reach the content administration
    Given I am an anonymous user
     When I go to "/admin/content"
     Then I should not see "Add content"
     When I go to "/node/add/webblog"
     Then I should not see "Create Web Blog"

  Scenario: An editor edits the pages that the site ships
    Given I am logged in as a user with the "content_editor" role
     When I go to the edit form of "/about-us"
     Then I should see "Edit Webpage" in the "h1" element
      And I should see "About us" in the "h1" element
      And "select[name='moderation_state[0][state]']" should be visible
     When I go to the edit form of "/blog/webship-js-advanced-screenshots"
     Then I should see "Webship-js Advanced Screenshots" in the "h1" element
      And "select[name='moderation_state[0][state]']" should be visible

  Scenario: An editor has the bulk actions of the content overview
    Given I am logged in as a user with the "content_editor" role
     When I go to "/admin/content"
     Then I should see "Webship-js Advanced Screenshots"
      And "select[name='action'] option[value='node_unpublish_action']" should be attached
      And "select[name='action'] option[value='node_publish_action']" should be attached

  Scenario Outline: An editor saves a draft of a <type>
    Given I am logged in as a user with the "content_editor" role
     When I go to "/node/add/<bundle>"
     Then "select[name='moderation_state[0][state]']" should be visible

    Examples:
      | type             | bundle  |
      | page             | webpage |
      | blog post        | webblog |
      | documentation    | webdoc  |
      | product          | product |
      | release          | release |

  Scenario: An editor cannot change the page layout
    Given I am logged in as a user with the "content_editor" role
     When I go to "/admin/structure/page-layout"
     Then I should not see "Default"

  Scenario: A webmaster manages the one page layout of the site
    Given I am logged in as a user with the "administrator" role
     When I go to "/admin/structure/page-layout"
     Then I should see "Default"
     When I go to "/admin/content"
     Then "select[name='action'] option[value='node_delete_action']" should be attached
