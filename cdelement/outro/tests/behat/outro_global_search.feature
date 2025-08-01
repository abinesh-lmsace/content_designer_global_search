# @mod @mod_contentdesigner @cdelement_outro  @javascript
# Feature: Verify the content designer global search support
#   In order to verify the content designer search support
#   As a teacher
#   I need to add contentdesigner activities to courses
#   Background:
#     Given the following "users" exist:
#       | username | firstname | lastname | email                |
#       | teacher1 | Teacher   | 1        | teacher1@example.com |
#       | student1 | Student   | 1        | student1@example.com |
#       | student2 | Student   | 2        | student2@example.com |
#     And the following config values are set as admin:
#       | enableglobalsearch | 1 |
#     And the following "courses" exist:
#       | fullname | shortname | category |
#       | Course 1 | C1 			 | 0 				|
#     And the following "course enrolments" exist:
#       | user 		 | course | role 					 |
#       | teacher1 | C1 		| editingteacher |
#       | student1 | C1 		| student 			 |
#     And the following "activity" exists:
#       | activity | contentdesigner              |
#       | name     | Demo content                 |
#       | intro    | Contentdesigner Description  |
#       | course   | C1                           |
#     And I log in as "admin"
#     And I navigate to "Server > Tasks > Scheduled tasks" in site administration
#     And I click on ".icon.fa.fa-pen" "css_element" in the "Global search indexing" "table_row"
#     And I set the following fields to these values:
#       | minute | * |
#     And I press "Save changes"
#     And I log out

# 	Scenario: Contentdesigner: Search: Add outro element title and description
#     Given I am on the "Demo content" "contentdesigner activity" page logged in as admin
#     Then I should see "Content editor"
#     And I click on "Content editor" "link"
#     And I click on ".course-content-list .element-item.item-outro .action-item[data-action=edit] a" "css_element"
#     #And I reload the page
#     And "Outro element settings" "text" should exist in the "#page-content #id_elementsettings" "css_element"
#     And I set the following fields to these values:
#       | Content 		| Lorem Ipsum is simply dummy text of the printing and typesetting industry. |
#       | Title       | Outro title       |
#       | Description | Outro description |
#     And I press "Update element"
#     And I trigger cron
#     And I wait "15" seconds
#     And I am on site homepage
#     And I update the global search index
# 	  And I search for "content" using the header global search box
#     And I should see "Demo content" in the ".search-results" "css_element"
# 	  # And I search for "title" using the header global search box
#     # And I should see "Demo content: Outro Title" in the ".search-results" "css_element"
#     # And I search for "Description" using the header global search box
#     # And I should see "Demo content: Outro description" in the ".search-results" "css_element"
# 		And I search for "Lorem Ipsum is simply dummy" using the header global search box
#     And I should see "Demo content: Outro Title" in the ".search-results" "css_element"
#     Then I click on "Demo content: Outro Title" "link" in the ".search-results" "css_element"
#     And "#page-mod-contentdesigner-view" "css_element" should exist
#     And I should see "Demo content" in the "#page-header" "css_element" 