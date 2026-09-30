Feature: The blog
  As a visitor
  I want to read the posts of Webship.co
  So that I learn about automated functional testing

  Scenario: The blog lists nine posts on a page, the newest first
    Given I am an anonymous user
     When I go to "/blog"
     Then I should see "Blog" in the "h1" element
      And "main .views-view-responsive-grid__item" should have a count of 9
      And I should see "Webship-js Adds Diffy API Support: Visual Regression Testing from Plain Gherkin"
      And I should see "Keeping Tests Stable: Waits and Selectors"
      And I should see "Video Recording: Playwright recordVideo Integration with Start/Stop/Save"
      And I should not see "Writing Your First Feature File"
      And the text "Webship-js Advanced Screenshots" should appear after the text "Webship-js Adds Diffy API Support"
      And every image should have an alt attribute
      And the heading hierarchy should be valid

  Scenario: The pager opens the older posts
    Given I am an anonymous user
     When I go to "/blog?page=1"
     Then "main .views-view-responsive-grid__item" should have a count of 6
      And I should see "Writing Your First Feature File"
      And I should see "Test-First Development in the Age of AI: Why It Matters"
      And I should see "What Is Playwright? Why Companies Are Rapidly Moving to It"

  Scenario: A general article shows a Gherkin example in a code block
    Given I am an anonymous user
     When I go to "/blog/testing-a-contact-form-end-to-end"
     Then I should see "Testing a Contact Form End to End" in the "h1" element
      And I should see "Mar 30, 2026"
      And "main pre code" should have a count of 3
      And I should see "Then every form field should have an accessible label"
      And the heading hierarchy should be valid

  Scenario: The blog is searched by a word
    Given I am an anonymous user
     When I go to "/blog"
      And I fill in "Search the blog" with "Diffy"
      And I press "Apply"
     Then I should see "Webship-js Adds Diffy API Support: Visual Regression Testing from Plain Gherkin"
      And I should not see "What Is Playwright? Why Companies Are Rapidly Moving to It"

  Scenario: A post shows its title, its date, its image and its text
    Given I am an anonymous user
     When I go to "/blog/webship-js-advanced-screenshots"
     Then I should see "Webship-js Advanced Screenshots" in the "h1" element
      And I should see "Aug 24, 2026"
      And I should see "Two files per capture, not one"
      And the page should have exactly one h1
      And every image should have an alt attribute
