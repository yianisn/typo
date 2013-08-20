Feature: Write Articles
  As a blog administrator
  In order to keep things tidy
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And the blog has the following users:
        | login          | password | email           | profile | name	   | state |
        | an_admin       | aaaaaaaa | user2@user2.net | 1       | aaaaaaaa | active |
        | non_admin 	 | aaaaaaaa | user3@user3.net | 2    	| aaaaaaaa | active |
    And the following articles exist:
        | User      | Title       | Body	    |
        | admin     | Article #2  | Article #2 body |
        | non_admin | Article #3  | Article #3 body |
        | non_admin | Article #4  | Article #4 body |

  Scenario: Display the merge section when editing an existing article
    Given I have logged in in the admin panel as user "an_admin"
    And I edit article "Article #2"
    Then I should see "Article #2"
    And I should see "Merge Articles"

  Scenario: Do not display the merge section when creating new articles
    Given I have logged in in the admin panel as user "an_admin"
    And I am on the new article page
    Then I should not see "Merge Articles"

  Scenario: Do not display the merge section to non administrators
    Given I have logged in in the admin panel as user "non_admin"
    And I edit article "Article #3"
    Then I should see "Article #3"
    And I should not see "Merge Articles"