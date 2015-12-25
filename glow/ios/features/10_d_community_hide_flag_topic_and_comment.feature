@forum @hide_report
Feature: Test hide/report topic/comment (4m40.131s 4 scenarios 38 steps)
	@hide_topic
	Scenario: User create a topic and hide it @hide_topic
		Given I create a new "ttc" glow user
		And another user create 1 topics and 1 comments and 1 subreply for each comment
		Then I login as the new user or default user
		And I open "community" page
		Then I go to the first group
		Then I enter topic created by another user
		Then I hide the topic
		Then I should not see the topic hidden by me
		Then I logout

	@report_topic
	Scenario: User create a topic and hide it @report_topic
		Given I create a new "ttc" glow user
		And another user create 1 topics and 1 comments and 1 subreply for each comment
		Then I login as the new user or default user
		And I open "community" page
		Then I go to the first group
		Then I enter topic created by another user
		Then I report the topic by reason "Wrong group"
		# Then I report the topic by reason "Spam"
		Then I should not see the topic hidden by me
		Then I logout

	@hide_comment
	Scenario: User create a topic and hide it @hide_comment
		Given I create a new "ttc" glow user
		And another user create 1 topics and 1 comments and 1 subreply for each comment
		Then I login as the new user or default user
		And I open "community" page
		Then I go to the first group
		Then I enter topic created by another user
		Then I hide the comment
		Then I should not see the comment hidden by me
		Then I go back to previous page
		Then I logout

	@report_comment
	Scenario: User create a topic and hide it @report_comment
		Given I create a new "ttc" glow user
		And another user create 1 topics and 1 comments and 1 subreply for each comment
		Then I login as the new user or default user
		And I open "community" page
		Then I go to the first group
		Then I enter topic created by another user
		Then I report the comment by reason "Spam"
		# Then I report the topic by reason "Spam"
		Then I should not see the comment hidden by me
		Then I go back to previous page
		Then I logout