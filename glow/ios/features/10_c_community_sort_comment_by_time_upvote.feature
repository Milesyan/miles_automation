@forum @order_by
Feature: Test order by time and order by upvote (1m40.347s 1 scenario 21 steps)
	Scenario: User create a topic and switch between order by time and upvote.
		Given I create a new "ttc" glow user with name "Miles"
		And "Miles" create 1 topic and 10 comments and 3 subreplies for each comment
		And the user upvote the first comment
		And I login as the new user "Miles" created through www
		And I open "community" page
		And I go to the first group
		And I enter topic created in previous step
		Then I should see "Show entire discussion"
		And I should see the last comment
		And I expand all the comments
		Then I click the hyperlink of comments
		Then I should see "✓ Sort by Upvotes"
		And I should see "Sort by Time"
		And I should see "Cancel"
		And I touch "Sort by Time"
		Then I should see "Test search comment 10"
		Then I click the hyperlink of comments
		And I touch "Sort by Upvotes"
		Then I should see "Test search comment 1"
		And I go back to group
    And I logout