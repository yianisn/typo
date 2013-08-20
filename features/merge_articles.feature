Feature: Write Articles
  As a blog administrator
  In order to keep things tidy
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And the blog has the following users:
        | login          | password | email           | profile | name  | state |
        | an_admin       | aaaaaaaa | user2@user2.net | 1       | aaaaaaaa | active |
        | non_admin | aaaaaaaa | user3@user3.net | 2    | aaaaaaaa | active |
#    And the following articles exist:
#        | id |  Title  | Body |
#        | 1 |  Article #1  | Article #1 body |
#        | 2 |  Article #2  | Article #2 body |
#        | 3 |  Article #3  | Article #3 body |
    And the user "an_admin" is logged into the admin panel

  Scenario: Do not display merge section when creating new articles
    Given I am on the new article page
    Then I should not see "Merge Articles"

  Scenario: Display the merge section when editing an existing article
    Given I edit article 1
    Then I should see "Merge Articles"
