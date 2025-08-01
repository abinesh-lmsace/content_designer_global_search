# @mod @mod_contentdesigner @element_search
# Feature: Verify the content designer global search support
#   In order to verify the content designer search support
#   As a teacher
#   I need to add contentdesigner activities to courses
#   Background:
#     Given the following "users" exist:
#       | username | firstname | lastname | email |
#       | teacher1 | Teacher | 1 | teacher1@example.com |
#       | student1 | Student | 1 | student1@example.com |
#       | student2 | Student | 2 | student2@example.com |
#     And the following config values are set as admin:
#         | enableglobalsearch | 1 |
#     And the following "courses" exist:
#       | fullname | shortname | category |
#       | Course 1 | C1 | 0 |
#     And the following "course enrolments" exist:
#       | user | course | role |
#       | teacher1 | C1 | editingteacher |
#       | student1 | C1 | student |
#     And the following "activity" exists:
#       | activity    | contentdesigner              |
#       | name        | Demo content                 |
#       | intro       | Contentdesigner Description  |
#       | course      | C1                           |
#     And I log in as "admin"
#     And I navigate to "Server > Tasks > Scheduled tasks" in site administration
#     And I click on ".icon.fa.fa-pen" "css_element" in the "Global search indexing" "table_row"
#     And I set the following fields to these values:
#       | minute | * |
#     And I press "Save changes"
#     And I log out

#   @javascript
#   Scenario: Contentdesigner: Search: Search basic activity info
#     Given I log in as "admin"
#     And I update the global search index
#     And I search for "Demo content" using the header global search box
#     And I should see "Demo content" in the ".search-results" "css_element"
#     Then I click on "Demo content" "link" in the ".search-results" "css_element"
#     And "#page-mod-contentdesigner-view" "css_element" should exist
#     And I should see "Demo content" in the "#page-header" "css_element"
#     Then I search for "Description" using the header global search box
#     And I should see "Contentdesigner Description" in the ".search-results .result-content" "css_element"
#     And I should see "Demo content" in the ".result-title" "css_element"
#     Then I log in as "student1"
#     And I search for "Demo content" using the header global search box
#     And I should see "Demo content" in the ".search-results" "css_element"
#     Then I log in as "student2"
#     And I search for "Demo content" using the header global search box
#     And I should not see "Demo content" in the ".search-results" "css_element"

#   @javascript
#   Scenario: Contentdesigner: Search: Add title and description with show/hide
#     Given I am on the "Demo content" "contentdesigner activity" page logged in as admin
#     Then I should see "Content editor"
#     And I click on "Content editor" "link"
#     And I click on ".course-content-list .topinstance.element-item .action-item[data-action=edit] a" "css_element"
#     And I reload the page
#     And "Intro text" "text" should exist
#     And I set the following fields to these values:
#       | Intro text  | Table of contents |
#       | Title       | TOC title         |
#       | Description | TOC description   |
#     And I press "Update element"
#     And I click on "Content editor" "link"
#     And I click on ".contentdesigner-addelement .fa-plus" "css_element"
#     And I click on ".elements-list li[data-element=heading]" "css_element" in the ".modal-body" "css_element"
#     And I set the following fields to these values:
#       | Heading text  | Heading 01          |
#       | Title         | Heading Title       |
#       | Description   | Heading Description |
#     And I press "Create element"
#     And I trigger cron
#     And I wait "15" seconds
#     And I am on site homepage
#     And I update the global search index
#     And I search for "Demo content" using the header global search box
#     And I search for "Title" using the header global search box
#     And I should see "Demo content: Heading Title" in the ".search-results" "css_element"
#     Then I click on "Demo content: Heading Title" "link" in the ".search-results" "css_element"
#     And "#page-mod-contentdesigner-view" "css_element" should exist
#     And I should see "Demo content" in the "#page-header" "css_element"
#     And I am on the "Demo content" "contentdesigner activity" page
#     And I click on "Content Designer" "link"
#     And "Heading Description" "text" should exist in the ".contentdesigner-wrapper .chapters-list .element-item .element-description" "css_element"
#     And "Heading Description" "text" should exist in the ".contentdesigner-wrapper .chapters-list .element-item .element-heading.hl-left.vl-top" "css_element"
