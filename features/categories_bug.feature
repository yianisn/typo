Feature: Write Articles
  As a blog administrator
  In order to organize the articles
  I want to be able to define categories

  Background:
    Given the blog is set up
    And the blog has the following users:
        | login          | password | email           | profile | name	   | state |
        | an_admin       | aaaaaaaa | user2@user2.net | 1       | aaaaaaaa | active |
        | non_admin 	 | aaaaaaaa | user3@user3.net | 2    	| aaaaaaaa | active |

  Scenario: Display the categories page
    Given I have logged in in the admin panel as user "an_admin"
    And I go to the category page
    Then I should see "Categories"

  Scenario: Add new category
    Given I have logged in in the admin panel as user "an_admin"
    And I go to the category page
    And I create a new category "Test"
    Then I should see "Test"
    And I should see "Test description"
    

